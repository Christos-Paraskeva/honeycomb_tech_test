class Delivery
  attr_accessor :name, :current_price, :discount, :order_count

  def initialize(name, original_price, discount_eligibility = false, discount_price = original_price)
    self.name = name
    self.discount = {
      original_price: original_price,
      discount_eligibility: discount_eligibility,
      discount_price: discount_price
    }
    self.current_price = discount[:original_price]
    self.order_count = 0
    check_discount_valid(discount[:discount_eligibility])
  end

  def increase_counter
    order_count.inspect
    self.order_count += 1
  end

  def decrease_counter
    self.order_count -= 1
  end

  private

  def check_discount_valid(value)
    raise ArgumentError unless (value.is_a? Integer) || (value == false)
  end
end
