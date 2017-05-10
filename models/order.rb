class Order
  COLUMNS = {
    broadcaster: 20,
    delivery: 8,
    price: 8
  }.freeze

  attr_accessor :material, :items, :result

  def initialize(material)
    self.material = material
    self.items = []
    @result = []
  end

  def add(broadcaster, delivery)
    delivery.counter += 1
    check_eligable_discount(delivery)
    items << [broadcaster, delivery]
  end

  def total_cost
    items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
  end

  def output
    [].tap do |result|
      result << "Order for #{material.identifier}:"
      result << print_columns
      result << print_output_separator
      result << print_information
      result << print_output_separator
      result << "Total: $#{total_cost}"
    end.join("\n")
  end






  def calculate_discount(delivery)
    if (delivery.counter >= delivery.discount[:discount_eligibility])
      return delivery.price = delivery.discount[:discount_price]
    end
  end

  private

  def check_eligable_discount(delivery)
    if (delivery.discount[:discount_eligibility] != false)
      calculate_discount(delivery)
    end
  end

  # def calculate_discount(delivery)
  #   if (delivery.counter >= delivery.discount[:discount_eligibility])
  #     return delivery.price = delivery.discount[:discount_price]
  #   end
  # end

  def print_information
    items.each_with_index do |(broadcaster, delivery), index|
      result << [
        broadcaster.name.ljust(COLUMNS[:broadcaster]),
        delivery.name.to_s.ljust(COLUMNS[:delivery]),
        ("$#{delivery.price}").ljust(COLUMNS[:price])
      ].join(' | ')
    end
    return result
  end

  def print_columns
    COLUMNS.map { |name, width| name.to_s.ljust(width) }.join(' | ')
  end

  def print_output_separator
    @output_separator ||= COLUMNS.map { |_, width| '-' * width }.join(' | ')
  end
end
