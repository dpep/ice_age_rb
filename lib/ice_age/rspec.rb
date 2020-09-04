require 'rspec/core'

RSpec.configure do |config|

  config.before do
    IceAge.restore
  end

end
