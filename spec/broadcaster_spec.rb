require './models/broadcaster'

describe Broadcaster do
  before(:each) do
    @broadcaster = Broadcaster.new(1, :test)
  end

  context 'is initialized with' do
    it 'an id' do
      expect(@broadcaster.id).to eq(1)
    end

    it 'a name' do
      expect(@broadcaster.name).to eq(:test)
    end
  end
end
