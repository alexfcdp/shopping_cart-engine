class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy, class_name: 'ShoppingCart::Order', foreign_key: :user_id
  has_one :billing_address, class_name: 'ShoppingCart::BillingAddress', as: :addressable,
                            dependent: :destroy
  has_one :shipping_address, class_name: 'ShoppingCart::ShippingAddress', as: :addressable,
                             dependent: :destroy
end
