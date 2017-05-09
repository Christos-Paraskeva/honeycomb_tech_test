require './models/order'

describe Order do
  subject { Order.new material }
  let(:material) { Material.new 'HON/TEST001/010' }
  let(:standard_delivery) { Delivery.new(:standard, 10) }
  let(:express_delivery) { Delivery.new(:express, 20, 2, 15) }

  before(:each) do
    @broadcaster_1 = Broadcaster.new(1, 'Viacom')
    @broadcaster_2 = Broadcaster.new(2, 'Disney')
    @broadcaster_3 = Broadcaster.new(3, 'Discovery')
  end

  it 'is initialized with an instance of material' do
    expect(subject.material).to be_a Material
  end

  context 'empty' do
    it 'costs nothing' do
      expect(subject.total_cost).to eq(0)
    end
  end

  context 'when making an order' do
    it 'adds order to the items array' do
      subject.add @broadcaster_1, standard_delivery
      expect(subject.items.length).to eq(1)
    end
  end

  context 'with items' do
    it 'returns the total cost of all items' do
      subject.add @broadcaster_1, standard_delivery
      subject.add @broadcaster_2, express_delivery
      expect(subject.total_cost).to eq(30)
    end
  end

  context 'with eligible discount' do
    it 'returns the correct total of the items' do
      subject.add @broadcaster_1, standard_delivery
      subject.add @broadcaster_2, express_delivery
      subject.add @broadcaster_3, express_delivery
      expect(subject.total_cost).to eq(40)
    end
  end
end
