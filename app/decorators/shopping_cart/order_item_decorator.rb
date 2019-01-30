# frozen_string_literal: true

module ShoppingCart
  class OrderItemDecorator < Draper::Decorator
    delegate_all

    def initialize(order, params)
      @order = order
      @params = params
    end

    def order_item
      @order_item ||= @order.order_items.find_by(@params.permit(:product_id, :id))
    end

    def sub_total
      price * quantity
    end

    def price
      order_item.blank? ? product.price : order_item.price
    end

    def quantity
      return add_quantity if order_item.present? && @params[:product_id].present?

      @params[:quantity].to_i
    end

    def add_quantity
      order_item.quantity + @params[:quantity].to_i
    end

    def product
      return order_item.product if order_item.present?

      @product ||= ShoppingCart.product_class.find_by(id: @params[:product_id])
    end
  end
end
