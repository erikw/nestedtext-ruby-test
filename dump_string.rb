#!/usr/bin/env ruby

require 'nestedtext'
require_relative 'apple'

# Ruy native types.
obj = {
  'list' => %w[i1 i2],
  'hash' => { 'k1' => 'v1', 'k2' => 'v2' },
  'string' => 'a string',
  "multiline\nkey" => 'value',
  'somekey' => "multiline\nstring"
}

# Custom object
# obj = [Apple.new('Granny Smith', 5)]

puts NestedText.dump(obj)
