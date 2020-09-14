require 'ice_age'

RSpec.shared_examples 'nothing changed' do
  it { expect(ENV['ICE_AGE_TEST']).to be_nil }
end

describe IceAge do
  it_behaves_like 'nothing changed'

  context 'when ENV is updated in a before block' do
    before { ENV['ICE_AGE_TEST'] = 'xxx' }

    it { expect(ENV['ICE_AGE_TEST']).to eq 'xxx' }
    it { expect(ENV.fetch('ICE_AGE_TEST')).to eq 'xxx' }
  end

  it_behaves_like 'nothing changed'

  context 'when ENV is updated in an example' do
    it 'works as expected' do
      ENV['ICE_AGE_TEST'] = 'zzz'

      expect(ENV['ICE_AGE_TEST']).to eq 'zzz'
    end

    # then resets
    it_behaves_like 'nothing changed'
  end

  it_behaves_like 'nothing changed'

  context 'when it gets complicated via nesting' do
    before { ENV['ICE_AGE_TEST'] = 'xxx' }

    it { expect(ENV['ICE_AGE_TEST']).to eq 'xxx' }

    context 'when nested' do
      it { expect(ENV['ICE_AGE_TEST']).to eq 'xxx' }
    end

    it { expect(ENV['ICE_AGE_TEST']).to eq 'xxx' }

    context 'when nested and changed further' do
      before { ENV['ICE_AGE_TEST'] = 'yyy' }

      it { expect(ENV['ICE_AGE_TEST']).to eq 'yyy' }
    end

    it { expect(ENV['ICE_AGE_TEST']).to eq 'xxx' }
  end

  it_behaves_like 'nothing changed'
end
