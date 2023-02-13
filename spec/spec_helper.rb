require 'byebug'
require 'simplecov'

SimpleCov.start do
  add_filter /spec/
end

if ENV['CI'] == 'true' || ENV['CODECOV_TOKEN']
  require 'simplecov_json_formatter'
  SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
end

require 'ice_age'
