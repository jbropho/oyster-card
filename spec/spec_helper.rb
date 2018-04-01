require 'simplecov'
require 'simplecov-console'
require 'byebug'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
   SimpleCov::Formatter::Console,
   SimpleCov::Formatter::HTMLFormatter
  ])
SimpleCov.start