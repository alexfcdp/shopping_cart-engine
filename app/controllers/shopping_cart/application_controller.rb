# frozen_string_literal: true

module ShoppingCart
  class ApplicationController < ActionController::Base
    include ShoppingCart::CurrentOrder
    helper_method :current_order
    layout 'layouts/application'

    private

    def default_url_options(options = {})
      { locale: I18n.locale }.merge options
    end
  end
end
