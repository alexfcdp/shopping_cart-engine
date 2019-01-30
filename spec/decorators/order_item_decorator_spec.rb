# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCart::OrderItemDecorator do
  let(:order) { create(:order) }
  let(:order_item) { order.order_items.first }
  let(:product) { order_item.product }
  let(:params) { ActionController::Parameters.new(product_id: product.id, id: order_item.id, quantity: 1) }
  let(:order_item_decorator) { ShoppingCart::OrderItemDecorator.new(order, params) }

  describe '#order_item' do
    it 'returns order_item' do
      expect(order_item_decorator.order_item).to eq(order.order_items.find_by(params.permit(:product_id, :id)))
    end
  end

  describe '#sub_total' do
    it 'returns sub_total' do
      sub_total = order_item.price * (order_item.quantity + params[:quantity].to_i)
      expect(order_item_decorator.sub_total).to eq(sub_total)
    end
  end

  describe '#price' do
    it 'returns price' do
      expect(order_item_decorator.price).to eq(order_item.price)
    end
  end

  describe '#quantity' do
    it 'returns quantity' do
      quantity = order_item.quantity + params[:quantity].to_i
      expect(order_item_decorator.quantity).to eq(quantity)
    end
  end

  describe '#add_quantity' do
    it 'returns add_quantity' do
      quantity = order_item.quantity + params[:quantity].to_i
      expect(order_item_decorator.add_quantity).to eq(quantity)
    end
  end

  describe '#book' do
    it 'returns book' do
      expect(order_item_decorator.product).to eq(product)
    end
  end
end
