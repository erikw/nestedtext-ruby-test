# frozen_string_literal: true

task default: %i[parse_file]

# Call like:
# $ rake parse_file F=path/to/file.nt
desc 'Run NT parser on a provided file.'
task :parse_file do
  raise 'Provide path to file to parse in envionment variable F' unless ENV.key? 'F'

  cur_dir = File.dirname(__FILE__)
  sh "#{cur_dir}/parse_file.rb #{ENV['F']}"
end

desc 'Dump a Ruby object to NestedText and print on stdout'
task :dump_string do
  cur_dir = File.dirname(__FILE__)
  sh "#{cur_dir}/dump_string.rb"
end

desc 'Parse a NestedText file and validate the result with an RSchema'
task :parse_validate do
  cur_dir = File.dirname(__FILE__)
  sh "#{cur_dir}/parse_validate.rb"
end
