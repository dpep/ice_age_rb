describe IceAge do
  context 'when ENV is updated' do
    before { ENV['ICE_AGE_TEST'] = 'xxx' }

    it 'endure! should fail since ENV changed' do
      expect { IceAge.endure! }.to raise_error(/ENV changed/)
    end
  end

  it 'does not allow .freeze to be called again' do
    expect { IceAge.freeze }.to raise_error(/already frozen/)
  end
end
