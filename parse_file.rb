#!/usr/bin/env ruby

require 'nestedtext'
require_relative 'apple'

raise 'Provide path to nestedtext file to parse as argument.' if ARGV.length != 1

begin
  pp NestedText.load_file(ARGV[0])
rescue NestedText::Error => e
  puts "Caught an Error: #{e.message}"
end
