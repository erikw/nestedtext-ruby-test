#!/usr/bin/env ruby
# This is an example of how NestedText can be paired with a schema validator to
# 1) assert that the parsed values are like the expected
# 2) automatically convert them to Ruby class instances like Integer, Float, etc.

require 'nestedtext'
require 'rschema'
require 'rschema/coercion_wrapper/rack_params'

script_dir = __dir__
conf_success = "#{script_dir}/nt/config_example_success.nt"
conf_fail = "#{script_dir}/nt/config_example_fail.nt"

# TODO: make stable optional
schema = RSchema.define do
  array(
    hash(
      'name' => _String,
      'ip' => _String,
      'port' => _Integer,
      optional('stable') => boolean
    )
  )
end
# The coercer will automatially convert types e.g. the value for the key "port" will become an Integer after coercion.
coercer = RSchema::CoercionWrapper::RACK_PARAMS.wrap(schema)

puts "\n\n### Success case"
data_success = NestedText.load_file(conf_success)
result = coercer.validate(data_success)
puts "#{conf_success} is #{result.valid? ? 'valid' : 'invalid'}"
puts 'Validated data:'
servers = result.value
pp servers

# 'servers' now has the expected types e.g. boolean and integer.
stable_servers = servers.select { |server| server['stable'] }
port_sum = servers.map { |server| server['port'] }.sum

puts "\n\n### Failure case"
data_fail = NestedText.load_file(conf_fail)
result = coercer.validate(data_fail)
if result.valid?
  puts "#{conf_fail} is valid"
else
  puts "#{conf_fail} is invalid"
  puts 'Validation errors:'
  pp result.error
end
