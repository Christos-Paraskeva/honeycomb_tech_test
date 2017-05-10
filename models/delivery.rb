class Delivery
  attr_accessor :name, :price, :discount, :order_count

  def initialize(name, price, discount_eligibility = false, discount_price = false)
    self.name = name
    self.price = price
    self.discount = {
      discount_eligibility: discount_eligibility,
      discount_price: discount_price,
    }
    self.order_count = 0
  end
end
