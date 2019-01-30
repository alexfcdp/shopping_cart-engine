# frozen_string_literal: true

require_dependency 'shopping_cart/application_controller'

module ShoppingCart
  class OrdersController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!

    def index
      @orders = OrdersFilterService.new(current_user, params[:filter]).call.decorate
    end

    def show
      @order = Order.find_by(id: params[:id]).decorate
    end
  end
end
