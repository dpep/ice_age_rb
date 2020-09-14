# This test should fail during before(:suite) since ENV is
# updated during load / parse time rather than test execution.

IceAge.freeze

describe IceAge do
  context 'when updated in the wrong spot' do
    # evaluated before testing starts, when file is initially loaded
    ENV['ICE_AGE_TEST'] = 'xxx'

    it { fail 'should fail before executing this' }
  end
end
