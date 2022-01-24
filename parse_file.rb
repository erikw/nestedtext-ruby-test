#!/usr/bin/env ruby

require 'nestedtext'

raise 'Provide path to nestedtext file to parse as argument.' if ARGV.length != 1

pp NestedText.load_file(ARGV[0])
