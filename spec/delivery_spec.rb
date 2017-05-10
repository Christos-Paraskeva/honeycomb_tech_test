require './models/delivery'

describe Delivery do

  before(:each) do
    @delivery = Delivery.new('standard_delivery', 10)
  end

  context 'when initialized' do
    it 'has a name' do
      expect(@delivery.name).to eq('standard_delivery')
    end

    it 'has a price' do
      expect(@delivery.price).to eq(10)
    end

    it 'has a default discount_eligibility parameter within a hash' do
      expect(@delivery.discount[:discount_eligibility]).to eq(false)
    end

    it 'has a default discount_price parameter within a hash' do
      expect(@delivery.discount[:discount_price]).to eq(false)
    end

    it 'has a counter' do
      expect(@delivery.order_count).to eq(0)
    end
  end
end
