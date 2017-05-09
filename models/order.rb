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
    items << [broadcaster, delivery]
  end

  def total_cost
    p items
    items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
  end

  def output
    [].tap do |result|
      result << "Order for #{material.identifier}:"
      result << columns
      result << output_separator
      result << print_information
      result << output_separator
      result << "Total: $#{total_cost}"
    end.join("\n")
  end

  private

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

  def columns
    COLUMNS.map { |name, width| name.to_s.ljust(width) }.join(' | ')
  end

  def output_separator
    @output_separator ||= COLUMNS.map { |_, width| '-' * width }.join(' | ')
  end
end
