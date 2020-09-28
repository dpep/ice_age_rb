# This test should fail during before(:suite) since ENV is
# updated in the wrong spot. This results in ENV updating
# during test load time rather than test execution.
# ENV should be set in a before or example block.

require 'ice_age/freeze'

describe IceAge do
  context 'when ENV is updated in the wrong spot' do
    ENV['ICE_AGE_TEST'] = 'xxx'

    it { fail 'IceAge.endure! should have failed during RSpec.before(:suite)' }
  end
end
