IceAge
======
Freeze your ENVironment during testing. ENV is reset before each test, making it trivial to maintain test isolation while testing your code with different environment variable values.


#### Install
```gem install ice_age```


#### Usage
```ruby
require 'ice_age'

describe 'Feature' do
  context 'with new feature enabled' do
    before { ENV['FEATURE_ENABLED'] = 'true' }

    it { expect(ENV['FEATURE_ENABLED']).to eq 'true' }

    # run tests against enabled feature
  end

  # ENV resets
  it { expect(ENV['FEATURE_ENABLED']).to be_nil }

  # run tests when feature is disabled
end
```


#### Inglorious Alternatives
```ruby
before do
  allow(ENV).to receive(:[]).and_call_original
  allow(ENV).to receive(:[]).with('FEATURE_ENABLED').and_return('true')
end


before do
  stub_const('ENV', ENV.to_hash.merge('FEATURE_ENABLED' => 'true'))
end


around do |example|
  ENV['FEATURE_ENABLED'] = 'true'

  example.run

  ENV['FEATURE_ENABLED'] = nil
end


# https://github.com/thoughtbot/climate_control
around do |example|
  ClimateControl.modify FEATURE_ENABLED: 'true' do
    example.run
  end
end
```

----
![Gem](https://img.shields.io/gem/dt/ice_age?style=plastic)
[![codecov](https://codecov.io/gh/dpep/ice_age_rb/branch/master/graph/badge.svg?token=S5F1PF9066)](https://codecov.io/gh/dpep/ice_age_rb)
[![codebeat badge](https://codebeat.co/badges/cf6afb0c-a510-4fbe-97d5-17e08826b144)](https://codebeat.co/projects/github-com-dpep-ice_age_rb-master)
