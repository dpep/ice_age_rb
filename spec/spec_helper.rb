require 'pry'

# prime ENV for testing
ENV.clear
ENV['ICE_AGE_TEST'] = '123'

$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'ice_age'

RSpec.configure do |config|
  config.before(:suite) do
    # strict mode
    expect { IceAge.endure! }.to raise_error(/ENV changed/)
  end
end
