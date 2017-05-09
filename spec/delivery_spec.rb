require './models/delivery'

describe Delivery do
  before(:each) do
    @delivery = Delivery.new('standard_delivery', 10)
  end

  context 'is initialized with' do
    it 'a name' do
      expect(@delivery.name).to eq('standard_delivery')
    end

    it 'a price' do
      expect(@delivery.price).to eq(10)
    end
  end
end
