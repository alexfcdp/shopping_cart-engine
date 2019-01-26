class Book < ApplicationRecord
  has_many :order_items, dependent: :destroy, class_name: 'ShoppingCart::OrderItem', foreign_key: :product_id
end
