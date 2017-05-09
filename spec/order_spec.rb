require './models/order'

describe Order do
  subject { Order.new material }
  let(:material) { Material.new 'HON/TEST001/010' }
  let(:standard_delivery) { Delivery.new(:standard, 10) }
  let(:express_delivery) { Delivery.new(:express, 20) }

  it 'is initialized with an instance of material' do
    expect(subject.material).to be_a Material
  end

  context 'empty' do
    it 'costs nothing' do
      expect(subject.total_cost).to eq(0)
    end
  end

  context 'when making an order' do
    it 'adds order to items array' do
      broadcaster_1 = Broadcaster.new(1, 'Viacom')
      subject.add broadcaster_1, standard_delivery
      expect(subject.items.length).to eq(1)
    end
  end

  context 'with items' do
    it 'returns the total cost of all items' do
      broadcaster_1 = Broadcaster.new(1, 'Viacom')
      broadcaster_2 = Broadcaster.new(2, 'Disney')

      subject.add broadcaster_1, standard_delivery
      subject.add broadcaster_2, express_delivery

      expect(subject.total_cost).to eq(30)
    end
  end
end
