require './models/printing'

class Order

  attr_accessor :material, :items, :result, :discount

  def initialize(material, discount)
    self.material = material
    self.items = []
    self.discount = discount
  end

  def add(broadcaster, delivery)
    delivery.order_count += 1
    delivery_discount_eligibility_and_calculation(delivery)
    items << [broadcaster, delivery]
  end

  def total_cost
    total_cost = items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
    if (eligible_for_discount?(total_cost))
      discount.calculate_total_cost(total_cost)
    else
      total_cost
    end
  end

  def send_to_printer(printing = Printing.new)
    printing.output(total_cost, items, material)
  end

  private

  def eligible_for_discount?(eligible_above = 30, total_cost)
    (total_cost > eligible_above) ? true : false
  end

  def delivery_discount_eligibility_and_calculation(delivery)
    if (delivery.discount[:discount_eligibility] != false)
      delivery.price = discount.calculate_delivery(delivery)
    end
  end
end
