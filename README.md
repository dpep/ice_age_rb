IceAge
======

Freeze your ENVironment during testing. Just in case you need to change ENV variables during tests, this library ensures that everything is reset before the next test runs.

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


around do |example|
  ENV['FEATURE_ENABLED'] = 'true'
  
  example.run
  
  ENV['FEATURE_ENABLED'] = nil
end
```

----
![Gem](https://img.shields.io/gem/dt/ice_age?style=plastic)
