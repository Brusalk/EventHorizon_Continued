# Generates the include.xml files for every folder in the project
# And adds them to the main toc file

require 'byebug'

# List of files in specific load order
CUSTOM_ORDERED_FILES = [
  ["lib", "init.lua"],
  ["lib", "class.lua"]
].map {|file_array| File.join(*file_array)}

TOC_FILE = File.join("EventHorizon", "EventHorizon.toc")
VERSION_REGEX = /^(?<order>\d+)_.*$/i
INCLUDE_TAG = "# X-Includes"

# Strip off leading folder so everything's relative to addon root like in toc file
default_ordered_files = Dir.glob("EventHorizon/**/*/*.lua").map {|file| file[13..-1]} - CUSTOM_ORDERED_FILES

ordered_files = CUSTOM_ORDERED_FILES + default_ordered_files

puts ordered_files.join("\n")

lines = IO.readlines(TOC_FILE).map(&:chomp!)
header_index = lines.index(INCLUDE_TAG)

raise "Failed to find proper indicies in EventHorizon.toc" if !header_index

(lines_to_keep, _) = lines.partition.with_index { |_, index| index <= header_index }

lines_to_keep.insert(header_index+1, *ordered_files)
lines_to_keep << "EventHorizon.lua\n"

puts "New EventHorizon.toc file:"
puts lines_to_keep

IO.write(TOC_FILE, lines_to_keep.join("\n"), mode: "w+")