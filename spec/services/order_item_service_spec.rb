# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ShoppingCart::OrderItemService do
  let(:order) { create(:order) }

  describe '#create' do
    let(:product) { create(:product) }
    let(:params) { ActionController::Parameters.new(product_id: product.id, quantity: 1, action: :create) }
    before { @result = ShoppingCart::OrderItemService.new(order, params).call }

    it 'returns true, if product is added to order' do
      expect(@result).to be true
    end

    it 'checks whether quantity is equal 1' do
      expect(order.order_items.find_by(product: product).quantity).to eq(1)
    end

    it 'checks if the order contains a product' do
      expect(order.order_items.find_by(product: product).product).to eq(product)
    end

    context 'checks for duplicates and increased quantity product' do
      before { ShoppingCart::OrderItemService.new(order, params).call }

      it 'adding the same product it is not duplicated' do
        expect(order.order_items.where(product: product).count).to eq(1)
      end

      it 'adding the same product, quantity increases' do
        expect(order.order_items.find_by(product: product).quantity).to eq(2)
      end
    end

    context 'returns method create if action: nil' do
      let(:new_product) { create(:product) }
      let(:parameters) { ActionController::Parameters.new(product_id: new_product.id, quantity: 3) }
      before { @result = ShoppingCart::OrderItemService.new(order, parameters).call }

      it 'returns true, if product is added to order' do
        expect(@result).to be true
      end

      it 'checks if the order contains a new_product' do
        expect(order.order_items.find_by(product: new_product).product).to eq(new_product)
      end

      it 'checks whether quantity is equal 3' do
        expect(order.order_items.find_by(product: new_product).quantity).to eq(3)
      end
    end
  end

  describe '#update' do
    let(:order_item) { order.order_items.first }
    let(:quantity) { order_item.quantity + 1 }
    let(:params) { ActionController::Parameters.new(quantity: quantity, id: order_item.id, action: :update) }
    before { @result = ShoppingCart::OrderItemService.new(order, params).call }

    it 'returns true if quantity of products is updated' do
      expect(@result).to be true
    end

    it 'checks whether quantity of products has changed' do
      order_item.reload
      expect(order_item.quantity).to eq(quantity)
    end

    it 'checks for duplicate products' do
      order.reload
      order.order_items.each do |item|
        expect(order.order_items.where(product: item.product).count).to eq(1)
      end
    end
  end

  describe '#destroy' do
    let(:order_item) { order.order_items.last }
    let(:params) { ActionController::Parameters.new(id: order_item.id, action: :destroy) }
    before { @result = ShoppingCart::OrderItemService.new(order, params).call }

    it '@result returns nil if order_item has been deleted' do
      expect(@result).to eq(nil)
    end

    it 'order_items does not contain order_item after deletion' do
      expect(order.order_items.find_by(id: order_item.id)).to eq(nil)
    end

    it 'destroy order if order_items is nil' do
      order.order_items.each do |item|
        ShoppingCart::OrderItemService.new(order, ActionController::Parameters.new(id: item.id, action: :destroy)).call
        expect(order.order_items.find_by(id: item.id)).to eq(nil)
        begin
          order.reload
        rescue StandardError
          nil
        end
      end
      expect(ShoppingCart::Order.find_by(id: order.id)).to eq(nil)
    end
  end
end
