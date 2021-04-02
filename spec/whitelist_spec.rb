describe 'IceAge::WHITELIST' do
  it 'is private' do
    expect { IceAge::WHITELIST }.to raise_error(NameError)
  end

  it 'ignores changes to whitelisted ENV variables' do
    # binding.pry sets LINES / COLUMNS
    ENV['LINES'] = '40'
    ENV['COLUMNS'] = '80'

    IceAge.endure!
  end
end
