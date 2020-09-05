IceAge
======

Freeze your ENVironment for testing.

#### Install
```gem install ice_age```


#### Usage
```ruby
# spec_helper.rb

require 'ice_age'
IceAge.freeze

# to enforce compliant ENV changes
RSpec.configure do |config|
  config.before(:suite) do
    IceAge.endure!
  end
end


# feature_spec.rb
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

----
![Gem](https://img.shields.io/gem/dt/ice_age?style=plastic)
