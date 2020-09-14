require 'rspec/core'

RSpec.configure do |config|

  config.before(:suite) do
    IceAge.frozen? ? IceAge.endure! : IceAge.freeze
  end

  config.before do
    IceAge.restore
  end

end
