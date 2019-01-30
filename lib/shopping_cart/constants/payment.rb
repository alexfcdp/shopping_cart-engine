# frozen_string_literal: true

module ShoppingCart
  module PaymentConst
    NUMBER = /\A[0-9]{4}+\Z/.freeze
    CARD_OWNER = /\A[a-zA-Z]+( [a-zA-Z]+)*\Z/.freeze
    EXPIRY_DATE = %r/\A(1[012]|0[1-9])\/(\d{2})\Z/.freeze
    MAX = 50
  end
end
