#!/usr/bin/env ruby

# Sets up travis.yml secure env vars based on current .travis_env.yml file
require 'yaml'
require 'travis/client'
require 'byebug'

secure_env_vars = YAML.load_file(".travis_env.yml")

secure_env_vars.each do |key, value|
  output = `travis encrypt '#{key}="#{value}"' -a`
  puts "Added ENV '#{key}'"
end

