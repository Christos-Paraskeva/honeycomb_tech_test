require './models/discount'

describe Discount do
  subject { Discount.new }

  context 'when conditions are met' do
    it 'applies discount to delivery' do
      delivery = double("Delivery")

      allow(delivery).to receive_messages(
        :discount => {
          discount_eligibility: 2,
          discount_price: 15
        },
        :order_count => 2)
      expect(subject.calculate_discount(delivery)).to eq(15)
    end
  end
end
