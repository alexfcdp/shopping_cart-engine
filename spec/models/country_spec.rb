# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ShoppingCart::Country, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:phone_code).of_type(:string) }
  end

  context 'relations' do
    it { is_expected.to have_many(:addresses).dependent(:destroy) }
  end
end
