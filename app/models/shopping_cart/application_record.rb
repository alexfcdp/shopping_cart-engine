# frozen_string_literal: true

module ShoppingCart
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
