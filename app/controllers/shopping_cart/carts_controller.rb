# frozen_string_literal: true

require_dependency 'shopping_cart/application_controller'

module ShoppingCart
  class CartsController < ApplicationController
    def update
      coupon = Coupon.find_by(code: params[:code])
      @coupon_applied = coupon.blank? ? false : current_order.update(coupon: coupon)
    end
  end
end
