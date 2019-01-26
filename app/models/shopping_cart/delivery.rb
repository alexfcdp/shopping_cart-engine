# frozen_string_literal: true

module ShoppingCart
  class Delivery < ApplicationRecord
    include ShoppingCart::DeliveryConst

    has_many :orders, dependent: :nullify

    validates :name, format: { with: REGEX_NAME, message: I18n.t('errors.delivery') }
    validates :terms, format: { with: REGEX_TERMS, message: I18n.t('errors.terms') }
    validates :price, numericality: { greater_than_or_equal_to: 0.00, message: I18n.t('errors.price') }
  end
end
