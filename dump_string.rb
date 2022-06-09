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
puts NestedText.dump(obj)
puts '=' * 20

# Custom object.
apples = [
  Apple.new('Granny Smith', 5),
  Apple.new('Red Sun', 7)
]
puts apples.to_nt

# NestedText.dump_file(obj, 'out.nt')
