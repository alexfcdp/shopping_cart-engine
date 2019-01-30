# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ShoppingCart::OrderItem, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:price).of_type(:decimal).with_options(precision: 8, scale: 2) }
    it { is_expected.to have_db_column(:quantity).of_type(:integer) }
    it { is_expected.to have_db_column(:sub_total).of_type(:decimal).with_options(precision: 8, scale: 2) }
    it { is_expected.to have_db_column(:product_id).of_type(:integer) }
    it { is_expected.to have_db_column(:order_id).of_type(:integer) }
  end

  context 'relations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:order) }
  end

  context 'validations' do
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0.01) }
    it { is_expected.to validate_numericality_of(:sub_total).is_greater_than_or_equal_to(0.01) }
    it { is_expected.to validate_numericality_of(:quantity).only_integer.is_greater_than_or_equal_to 1 }
  end
end
