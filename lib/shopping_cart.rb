# frozen_string_literal: true

require 'shopping_cart/engine'

module ShoppingCart
  require_relative 'shopping_cart/constant.rb'

  mattr_accessor :product_class
  mattr_accessor :user_class

  def self.product_class
    @@product_class.constantize
  end

  def self.user_class
    @@user_class.constantize
  end
end
