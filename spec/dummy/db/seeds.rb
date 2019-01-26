require 'ffaker'

10.times do
  Book.create!(title: FFaker::Book.title, description: FFaker::Book.description, price: rand(3.5..100))
end

User.create!(email: 'admin@amazing.com', password: '12345678')

ShoppingCart::Coupon.create!(code: '666666', discount: 25)

ShoppingCart::Delivery.create!(name: 'DHL Global', terms: '1 to 5 day', price: 50)

ShoppingCart::Country.create!(name: 'Ukraine', phone_code: '+380')
7.times do
  ShoppingCart::Country.create!(name: FFaker::Address.country, \
                                phone_code: FFaker::PhoneNumber.phone_calling_code)
end

User.first.create_billing_address(firstname: 'Alex', lastname: 'Doe', address: 'Kirova 112', \
                                  city: 'Dnipro', zip: '49000', phone: '+380972293095', country_id: 1)
User.first.create_shipping_address(firstname: 'Nikita', lastname: 'John', address: 'Pobeda 36', \
                                   city: 'Kiev', zip: '49000', phone: '+380675423870', country_id: 1)

User.all.each do |u|
  rand(1..3).times do
    number = "R#{Array.new(8) { [*'0'..'9'].sample }.join}"
    u.orders.create!(order_number: number, delivery: ShoppingCart::Delivery.first, coupon: ShoppingCart::Coupon.first)
  end
  u.orders.create!(order_number: "R#{Array.new(8) { [*'0'..'9'].sample }.join}", delivery: ShoppingCart::Delivery.first)
end

ShoppingCart::Order.all.each do |order|
  book = Book.all[rand(0..9)]
  quantity = rand(1..30)
  sub_total = book.price * quantity
  order.order_items.create!(price: book.price, quantity: quantity, sub_total: sub_total, product: book)
  order.create_billing_address(firstname: 'Alex', lastname: 'Doe', address: 'Kirova 112', \
                               city: 'Dnipro', zip: '49000', phone: '+380972293095', country_id: 1)
  order.create_shipping_address(firstname: 'Nikita', lastname: 'John', address: 'Pobeda 36', \
                                city: 'Kiev', zip: '49000', phone: '+380675423870', country_id: 1)
  order.create_credit_card(number: rand(1000..9999), card_owner: FFaker::NameDE.name, expiry_date: '12/20')
  discount = order.coupon.blank? ? 0 : order.coupon.discount
  total = sub_total - discount + order.delivery.price
  order.update!(total_price: total, status: ShoppingCart::Order.statuses.keys[rand(1..4)])
end
