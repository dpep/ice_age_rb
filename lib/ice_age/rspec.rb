require 'rspec/core'

RSpec.configure do |config|

  config.before(:suite) do
    IceAge.frozen? ? IceAge.endure! : IceAge.freeze
  end

  config.after do
    IceAge.restore
  end

end
