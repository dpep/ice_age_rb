require 'pry'

$LOAD_PATH.unshift(File.expand_path('../', __FILE__))
require 'ice_age'

# prime ENV for testing
ENV.clear
ENV['ICE_AGE_TEST'] = '123'
IceAge.freeze


RSpec.configure do |config|
  config.before(:suite) do
    # test strict mode
    expect { IceAge.endure! }.to raise_error(/ENV changed/)
  end
end
