require 'rspec/core'

RSpec.configure do |config|

  # config.before(:suite) do
  #   # enforce compliant ENV changes
  #   IceAge.endure!
  # end

  config.before do
    IceAge.restore
  end

end
