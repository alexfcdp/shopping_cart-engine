# frozen_string_literal: true

module ShoppingCart::CurrentOrder
  extend ActiveSupport::Concern

  included do
    def current_order
      @current_order ||= ShoppingCart::FindOrderService.new(current_user, session[:order_id]).call
      session[:order_id] = nil if user_signed_in?
      @current_order
    end
  end
end
