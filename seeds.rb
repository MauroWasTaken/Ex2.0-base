require_relative 'connection'
require_relative 'models'

pcr = Category.create!(name: 'PCR')
sup = Category.create!(name: 'SUP')

supplier1 = Supplier.create!(name: 'Mauro inc')
supplier2 = Supplier.create!(name: 'Santos©')

product1 = Product.create!(name: 'apple', price: 0.05, description: 'Little apple', category: pcr)
product2 = Product.create!(name: 'lemon', price: 6.15, description: 'Big lemon', category: pcr)
product3 = Product.create!(name: 'limousine', price: 25.95, description: 'A limousine', category: sup)
product4 = Product.create!(name: 'truck', price: 200, description: 'A truck', category: sup)

supplier1.products << product1
supplier1.products << product2
supplier2.products << product4

client = Particular.create!(firstname: 'yannick', lastname: 'baudraz')
Company.create!(firstname: 'john', lastname: 'doedoe')

order1 = Order.new(status: 'PROGRESS')
order1.order_items << [
  OrderItem.new(quantity: 2, product: product1),
  OrderItem.new(quantity: 125, product: product3),
  OrderItem.new(quantity: 3, product: product4)
]
client.orders << order1
order1.save!
client.save!

order2 = Order.new(status: 'PROGRESS')
order2.order_items << [
  OrderItem.new(quantity: 1,product: product1),
  OrderItem.new(quantity: 75, product: product2),
  OrderItem.new(quantity: 3, product: product3),
  OrderItem.new(quantity: 200, product: product4)
]
client.orders << order2
order2.save!
client.save!

puts '--SEEDERS DONE--'