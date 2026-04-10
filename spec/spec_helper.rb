require 'debug'
require 'rspec'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

if ENV['CI'] == 'true' || ENV['CODECOV_TOKEN']
  require 'simplecov_json_formatter'
  SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
end

require 'ice_age'

RSpec.configure do |config|
  config.filter_run_when_matching :focus

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
