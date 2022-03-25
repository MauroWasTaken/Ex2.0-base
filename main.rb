require_relative 'connection'
require_relative 'models'

def ex3
    puts "--EXIGENCY N°3--"
    puts
  
    client = Client.first
    puts "Use client => #{client}"
    puts
  
    puts '--Display cheap products from client--'
    client.products.cheap.each { |p| puts p }
    puts
  
    puts '--Display products ordered with a quantity of more than 50--'
    OrderItem.bulk(50).each { |oi| puts "#{oi.product}; Ordered #{oi.quantity}" }
    puts
    puts
end

def ex4
    puts "--EXIGENCY N°4--"
    puts

    puts "--Cient Validation--"
    puts
    Client.create!(firstname: 'john', lastname: 'doedoe')


    puts "--Order Validation--"
    puts
    client = Client.first
    order = Order.new(client: client)
    puts "Order.new(client: client)=> #{order.save}"
    puts
  
    order.order_items.build
    puts "Order.order_items.build => #{order.save}"
    puts
    order.order_items.clear
    order.order_items.build(quantity: 10)
    puts "Order.order_items.build(quantity: 10) #{order.save}"
    puts
    order.order_items.clear
    order.order_items.build(product: Product.first)
    puts "Order.order_items.build(product: Product.first) #{order.save}"
    puts

    order.order_items.clear
    order.order_items.build(product: Product.first, quantity: 10)
    puts "Order.order_items.build(product: Product.first) #{order.save}"
    ##puts order.order_items.map {|oi| oi.errors.full_messages }
    puts
end

def ex5
    puts "--EXIGENCY N°5--"
    puts

    puts "--Order Total Price--"
    puts
    puts "#{Order.first.price} .-"
    puts

    puts "--OrderItem Total Price--"
    puts
    puts "#{Order.first.order_items.first.price} .-"
    puts
end

def ex6
    puts "--EXIGENCY N°6--"
    puts

    puts "--List Of Client--"
    puts
    puts "#{Client.all.count}"
    puts

    puts "--List Of Particular--"
    puts
    puts "#{Particular.all.count}"
    puts

    puts "--List Of Companies--"
    puts
    puts "#{Company.all.count}"
    puts
end

def ex7
    puts "--EXIGENCY N°7--"
    puts
    supplier1 = Supplier.first
    puts "--First Supplier--"
    puts
    puts "#{supplier1.name} has #{supplier1.products.count} products"
    supplier1.products.each { |p| puts "#{p.name}" }
    puts "And #{supplier1.categories.count} categories"
    supplier1.categories.each { |c| puts "#{c.name}"}
end

def ex8
    puts "--EXIGENCY N°8--"
    puts
    user1 = Client.first
    user2 = Client.second
    supplier1 = Supplier.first
    product1 = Product.first
    puts "----"
    supplier1.comments << [
        Comment.create(content:"veri coll",author: user1),
        Comment.create(content:"pogchamp",author: user2)
    ]if supplier1.comments.count == 0
    puts "#{supplier1.name}'s comments"
    supplier1.comments.each{ |c| puts c.content }
    product1.comments << [
        Comment.create(content:"got sick after :(",author: user1),
        Comment.create(content:"not poggers",author: user2)
    ]if product1.comments.count == 0
    puts
    puts "#{product1.name}'s comments"
    product1.comments.each{ |c| puts c.content }
end
def ex1Suite
    puts "--EXIGENCY N°1 SUITE--"
    puts
    puts Order.most_expensive.price
    client = Client.first
    order1 = Order.new(status: 'PROGRESS')
    order1.order_items << [
        OrderItem.new(quantity: 2330, product: Product.first),
        OrderItem.new(quantity: 1250, product: Product.third),
        OrderItem.new(quantity: 3000, product: Product.last)
    ]
    client.orders << order1
    client.save!
    puts Order.most_expensive.price
    order1.delete
end
def ex2Suite
    puts "--EXIGENCY N°2 SUITE--"
    puts
    puts Category.unused.each{ |c| puts c.name }
    category1 = Category.create!(name: 'UnusedCategory')
    Category.unused.each{ |c| puts c.name }
    product=Product.create!(name: 'truck', price: 200, description: 'A truck', category: category1)
    Category.unused.each{ |c| puts c.name }
    product.destroy
    category1.destroy
end
def ex3Suite
    puts "--EXIGENCY N°3 SUITE--"
    puts
    client = Particular.create!(firstname: 'Mauro', lastname: 'Santos')
    puts Client.
end
ex3Suite
