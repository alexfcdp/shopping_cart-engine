# frozen_string_literal: true

module ShoppingCart
  class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product, counter_cache: true, class_name: ShoppingCart.product_class.to_s

    validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :price, :sub_total, numericality: { greater_than_or_equal_to: 0.01 }

    scope :id_asc, -> { order(id: :asc) }
  end
end
