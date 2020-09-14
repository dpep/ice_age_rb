# This test should fail during before(:suite) since ENV is
# updated in the wrong spot. This results in ENV updating
# during load / parse time rather than test execution.
# ENV should be set in a before or example block.

describe IceAge do
  context 'when ENV is updated in the wrong spot' do
    ENV['ICE_AGE_TEST'] = 'xxx'

    it { fail 'should fail before executing this' }
  end
end
