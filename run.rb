#!/usr/bin/env ruby

require './models/broadcaster'
require './models/delivery'
require './models/material'
require './models/discount'
require './models/order'

standard_delivery_1 = Delivery.new(:standard, 10.0)
express_delivery_1 = Delivery.new(:express, 20.00, 2, 15.00)

standard_delivery_2 = Delivery.new(:standard, 10.0)
express_delivery_2 = Delivery.new(:express, 20.00, 2, 15.00)

broadcaster_1 = Broadcaster.new(1, 'Viacom')
broadcaster_2 = Broadcaster.new(2, 'Disney')
broadcaster_3 = Broadcaster.new(3, 'Discovery')
broadcaster_4 = Broadcaster.new(4, 'ITV')
broadcaster_5 = Broadcaster.new(5, 'Channel 4')
broadcaster_6 = Broadcaster.new(6, 'Bike Channel')
broadcaster_7 = Broadcaster.new(7, 'Horse and Country')

material_1 = Material.new('WNP/SWCL001/010')
material_2 = Material.new('ZDW/EOWW005/010')

discount = Discount.new

order_1 = Order.new(material_1, discount)
order_2 = Order.new(material_2, discount)

order_1.add(broadcaster_2, standard_delivery_1)
order_1.add(broadcaster_3, standard_delivery_1)
order_1.add(broadcaster_1, standard_delivery_1)
order_1.add(broadcaster_7, express_delivery_1)

order_2.add(broadcaster_2, express_delivery_2)
order_2.add(broadcaster_3, express_delivery_2)
order_2.add(broadcaster_1, express_delivery_2)

print order_1.checkout_order
print "\n"
print ".........................................."
print "\n"
print order_2.checkout_order
print "\n"