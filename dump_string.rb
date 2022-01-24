#!/usr/bin/env ruby

require 'nestedtext'

obj = {
  'list' => %w[i1 i2],
  'hash' => { 'k1' => 'v1', 'k2' => 'v2' },
  'string' => 'a string',
  "multiline\nkey" => 'value',
  'somekey' => "multiline\nstring"
}

puts NestedText.dump(obj)
