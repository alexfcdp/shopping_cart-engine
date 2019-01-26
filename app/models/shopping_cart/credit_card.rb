# frozen_string_literal: true

module ShoppingCart
  class CreditCard < ApplicationRecord
    include ShoppingCart::PaymentConst

    belongs_to :order

    validates :number, format: { with: NUMBER }, presence: true
    validates :card_owner, length: { maximum: MAX }, format: { with: CARD_OWNER }, presence: true
    validates :expiry_date, format: { with: EXPIRY_DATE, message: I18n.t('errors.expiry_date') }, presence: true
  end
end
