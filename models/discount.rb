class Discount

  def calculate_delivery(delivery)
    if (delivery.order_count >= delivery.discount[:discount_eligibility])
      delivery.discount[:discount_price]
    else
      delivery.price
    end
  end

  def calculate_total_cost(percent_off = 10, total_cost)
    total_cost -= calculate_percentage_off(total_cost)
  end

  private

  def calculate_percentage_off(total_cost, percent_off = 10)
    total_cost * (percent_off / 100.round(1))
  end

end
