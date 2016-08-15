#!/usr/bin/env ruby

require 'discordrb'
require 'semantic'
require 'git'
require 'zip'
require 'tempfile'
require 'active_support/all'
require 'byebug'

require_relative 'travis/env'
TravisEnv.reload

module Kernel
  alias_method :real_backticks, :'`'

  def `(cmd) 
    puts "`#{cmd}`"
    puts "#{output = real_backticks(cmd)}"
    output
  end
end

class BuildError < StandardError; end

class GitHelper

  GIT = Git.open("./")
  SEMVER_REGEX = /\Av{0,1}(\d+\.\d+\.\d+)(-([0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*))?(\+([0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*))?\Z/
  GITHUB_URL = "https://github.com/Brusalk/EventHorizon_Continued/"

  # Needs to be a GPG key verifiable as Brusalk, and the tag should be named `build-<version#>`
  def self.verified_build_tag?(tag_name="")
    with_verified_tag(tag_name) do |name|
      true
    end
  end

  def self.verified_tag_name(tag_name="")
    with_verified_tag(tag_name) do |name|
      name[6..-1] # Strip off the build prefix
    end
  end

  def self.with_verified_tag(tag_name="")
    tag_name = self.tag_name(tag_name)

    ret = false

    if tag_name.starts_with? "build-"
      if (GIT.tag(tag_name) rescue nil)
        `git verify-tag '#{tag_name}'`
        if $?.success?
          ret = yield tag_name
        end
      end
    end

    return ret
  end

  def self.tag_name(tag_name="")
    return tag_name if !tag_name.blank?
    return ENV["TRAVIS_TAG"] if !ENV["TRAVIS_TAG"].blank?
    `git describe --exact-match --tags $(git log -n1 --pretty='%h')`[0...-1]
  end

  def self.previous_tag
    versions, oddballs = self.versions
    versions.second || versions.first
  end

  # Return a list of Semantic::Versions in order from newest to oldest
  def self.versions
    versions, oddballs = semantic_versions

    # Find the original tag for each version
    sorted_tags = versions.map do |version|
      GIT.tags.find { |tag| tag.name.include?(version.to_s) } # We know that tag name will include version string (v1.2.3 includes 1.2.3)
    end

    return sorted_tags.map(&:name), oddballs
  end

  # Iterates over pairs of release tag names in newest to oldest order, with each pair being (older, newer)
  # (v1.10.12, v1.10.14)
  # (v1.9.10, v1.10.12)
  def self.each_release_tag
    versions, _ = self.versions
    versions.each_cons(2) do | a, b | # Each pair of tag names, reverse to get desired order
      yield(b, a)
    end
  end

  def self.each_deprecated_tag
    _, oddballs = self.versions
    oddballs.each { |o| yield o }
  end

  def self.semantic_versions
    versions, oddballs = GIT.tags.reduce([[], []]) do |(version_acc, oddball_acc), tag|
      tag_name = tag.name
      if tag_name =~ SEMVER_REGEX && tag_name.starts_with?("v")
        tag_name = tag_name[1..-1] # Stripping the v will make it semantically versioned
      end

      begin
        version_acc << Semantic::Version.new(tag_name)
      rescue ArgumentError # Not a semantic versionable version
        oddball_acc << tag_name
      end
      [version_acc, oddball_acc]
    end

    versions.sort!.reverse! rescue versions
    oddballs.sort! rescue oddballs
    return versions, oddballs
  end
end


class Notifier

  attr_reader :channel_ids

  def initialize token:, application_id:, channel_ids: []
    @discord_bot = Discordrb::Bot.new(token: token, application_id: application_id)
    @channel_ids = channel_ids
    @discord_bot.run_async
  end

  def release
    msgs = channel_ids.map do |id|
      @discord_bot.send_message(id, "Test Message")
    end
    @discord_bot.stop
  end

end

class ChangeLog

  HISTORY_FINAL_TAG = "v1.9.11"
  HISTORY_FILE_LOCATION = "EventHorizon/HISTORY.md"

  def self.update
    generate_changelog
  end

  def self.generate_changelog
    `github_changelog_generator --base "#{HISTORY_FILE_LOCATION}" --since-tag "#{HISTORY_FINAL_TAG}" --future-release #{GitHelper.verified_tag_name}`
  end

end

class ReleaseZip

  def self.build
    `rm -f #{self.zip_path}`
    Zip::File.open(zip_path, Zip::File::CREATE) do |zipfile|
      files_to_include.each do |file|
        zipfile.add(file, file)
      end
    end
  end

  private

  def self.zip_path
    "./EventHorizon_Continued-#{GitHelper.verified_tag_name}.zip"
  end

  def self.files_to_include
    # We find all files that are inside our EventHorizon addon folders
    candidates = `find ./EventHorizon* -type f -print`.split("\n")

    # We only want to include files that we aren't git-ignoring
    # git check-ignore only outputs if the file should be ignored
    # In our semantics, this mean we don't want to include the file
    # Thus we should only take candidates that shouldn't be ignored 
    candidates.select {|f| `git check-ignore "#{f}"`.blank? }
  end

end


class TOCBumper

  FILES = Dir.glob("EventHorizon*/*.toc")

  def self.bump_versions
    FILES.each do |path|
      TOCFile.new(path).bump_version
    end
  end

end

class TOCFile

  class VersionLineNotFound < BuildError; end

  def initialize(file)
    @file = file
  end

  def bump_version
    with_file do |file, contents|
      if (index = contents.find_index { |line| line.starts_with?("## Version: ") })
        contents[index] = "## Version: #{GitHelper.verified_tag_name}"
      elsif (index = contents.find_index { |line| line.starts_with?("## Author: ") })
        # Find Author, and put it right below
        contents.insert(index+1, "## Version: #{GitHelper.verified_tag_name}")
      end

      file.puts contents
    end
  end

  private

  def with_file(mode="w+", *args, **kwargs)
    contents = File.readlines(@file)
    begin
      File.open(@file, mode, *args, **kwargs) do |file|
        yield file, contents.dup
      end
    rescue
      # Put the file back how it was before re-raising
      File.open(@file, "w+", *args, **kwargs) do |file|
        file.puts(contents)
      end
      raise
    end
  end
end

# Basic Process
# If we get a build for a tag "build-v1.1.1" we'll run the full build step for v1.1.1
# We'll then go back and delete the original build-tag on success.
class Builder
  def initialize(*args, **kwargs)
    @notifier = Notifier.new(*args, **kwargs)
  end

  def self.build(*args, **kwargs)
    new(*args, **kwargs).build
  end


  def build

    puts "Build Starting:"

    exit(1) if [          # We do each build step in order. If we fail we exit status 1 to notify travis of the failure
      :import_gpg_key,
      :verify_build_tag,
      :start,
      :update_changelog,
      :bump_versions,
      :build_zip,
      :create_release_tag,
      :notify_release
    ].find do |step|
      puts "-"*80
      puts "#{step}"
      puts "-"*80
      success = send(step)
      puts "-"*80
      !success
    end

  end

  private

  # Each step should return falsey if the step failed

  def import_gpg_key
    # Import the public key
    `gpg --import 'brusalk_public_key.gpg.pub'`
    success = $?.success?

    # Ultimately trust the gpg key to verify key validity
    gpg_fingerprint = `gpg --with-fingerprint brusalk_public_key.gpg.pub | awk ' /Key fingerprint = / {out=""; for(i=4;i<=NF;i++){out=out""$i}; print out}'`[0...-1]
    `echo "#{gpg_fingerprint}:6:" | gpg --import-ownertrust`

    success
  end

  def verify_build_tag
    puts "Checking tag: #{`git tag`}"
    if !GitHelper.verified_build_tag?
      puts "Build not for a verified build trigger tag -- Exiting"
      puts " - #{GitHelper.verified_build_tag?}"
      return
    end
    true
  end

  def start
    puts "Starting Build for Tag: #{GitHelper.verified_tag_name}"
    true
  end

  def update_changelog
    ChangeLog.update
    true
  end

  def build_zip
    ReleaseZip.build
    true
  end

  def bump_versions
    TOCBumper.bump_versions
    true
  end

  def notify_release
    @notifier.release
    true
  end

  def create_release_tag
    success     = false
    version     = GitHelper.verified_tag_name
    message     = "Official Release of EventHorizon #{version} - #{DateTime.now}"
    gpg_user_id = `gpg --keyid-format long --list-keys Brusalk | awk '/^pub/ { print $2 }' | awk -F "/" '{ print $2 }'`[0...-1]

    `git config --local user.name Brusalk`
    `git config --local user.email <Brusalk@users.noreply.github.com>`
    `git config --local push.default current`

    # In order to let us create the verified release tag without manually entering our passphrase
    # We have to create a replacement gpg that uses our passphrase
    # and tell git to use it
    old_gpg_program = `git config gpg.program`
    Tempfile.open("pgp-with-passphrase") do |f|
      path = f.path

      f.puts "gpg --passphrase \"#{ENV['GPG_KEY_PASSWORD']}\" --batch --no-tty \"$@\""
      f.flush # Write to the file

      `chmod 755 #{f.path}`

      `git config gpg.program '#{f.path}'`


      # We need to first commit our changes. This'll be stuff like the TOC version bump, and the changelog
      `git commit -am "#{message}" --gpg-sign="#{gpg_user_id}"`
      success = $?.success?

      # Now we can create our tag
      `git tag -u #{gpg_user_id} #{GitHelper.verified_tag_name} -m "#{message}"` if success
      success = $?.success?

      # Push updated commit/associated tags to remote
      `git push --follow-tags` if success
      success = $?.success?

      if success
        # Delete build tag
        `git push --delete origin #{GitHelper.tag_name}`
      end

    end

    # Set it back
    if old_gpg_program.blank?
      `git config --unset gpg.program`
    else
      `git config gpg.program '#{old_gpg_program}'` 
    end


    return success
  end

end

if __FILE__ == $0
  begin
    Builder.build(
      token: ENV['DISCORD_BOT_TOKEN'],
      application_id: ENV['DISCORD_BOT_APPLICATION_ID'],
      channel_ids: [
        208106562978447360  
      ]
    )
  rescue Exception => e
    puts "Unhandled exception while building:"
    puts "#{e}"
    puts "#{e.message}"
    puts "#{e.backtrace}"
    exit(2)
  end
end

