# frozen_string_literal: true

module ShoppingCart
  class Address < ApplicationRecord
    include ShoppingCart::AddressConst

    belongs_to :addressable, polymorphic: true
    belongs_to :country, optional: { unless: :skip_validation }

    validates :address, :zip, :phone, :firstname, :lastname, :city, presence: true, unless: :skip_validation
    validates :address, length: { maximum: MAX_LENGTH }, format: { with: ADDRESS }, unless: :skip_validation
    validates :zip, format: { with: ZIP }, unless: :skip_validation
    validates :phone, format: { with: PHONE }, unless: :skip_validation
    validates :firstname, :lastname, :city, length: { maximum: MAX_LENGTH },
                                            format: { with: TEXT_FIELDS }, unless: :skip_validation
    validate :validate_phone_code

    attr_accessor :skip_validation

    def validate_phone_code
      return if phone.blank?

      country = Country.find(country_id)
      return if phone.include?(country.phone_code)

      errors.add(:phone, I18n.t('errors.phone') + country.phone_code)
    end
  end
end
