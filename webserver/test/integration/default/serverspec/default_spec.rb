require 'spec_helper'

describe 'apache' do
  it 'displays a custom home page' do
    expect(command('curl localhost').stdout).to match /hello/
  end

  it 'is listening to port 80' do
    expect(port 80).to be_listening
  end
end
