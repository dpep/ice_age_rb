require 'byebug'

require 'simplecov'
SimpleCov.start do
  add_filter /spec/
end

if ENV['CI'] == 'true' || ENV['CODECOV_TOKEN']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'ice_age'
