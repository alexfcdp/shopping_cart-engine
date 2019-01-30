# frozen_string_literal: true

module ShoppingCart
  class Country < ApplicationRecord
    has_many :addresses, dependent: :destroy
  end
end
