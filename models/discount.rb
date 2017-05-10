class Discount

  def calculate_delivery_discount(delivery)
    if (delivery.order_count >= delivery.discount[:discount_eligibility])
      return delivery.discount[:discount_price]
    else
      delivery.price
    end
  end

end
