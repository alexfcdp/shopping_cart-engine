# frozen_string_literal: true

module ShoppingCart
  module DeliveryConst
    REGEX_NAME = /\A[a-zA-Z]+( [a-zA-Z-]+)*\Z/.freeze
    REGEX_TERMS = /\A[a-zA-Z0-9]+( [a-zA-Z0-9-]+)*\Z/.freeze
  end
end
