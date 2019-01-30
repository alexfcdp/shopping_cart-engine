# frozen_string_literal: true

module ShoppingCart
  class AddressDecorator < Draper::Decorator
    delegate_all

    def self.countries
      Country.all.map { |country| [country.name, country.id] }
    end
  end
end
