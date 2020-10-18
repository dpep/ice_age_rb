require 'pry'
require 'simplecov'
SimpleCov.start

if ENV['TRAVIS'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

$LOAD_PATH.unshift(File.expand_path('../', __FILE__))
require 'ice_age'
