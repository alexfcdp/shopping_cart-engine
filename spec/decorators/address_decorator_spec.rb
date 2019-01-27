# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingCart::AddressDecorator do
  describe '#self.countries' do
    before do
      create(:country, id: 1, name: 'Ukraine', phone_code: '+380')
      create(:country, id: 2, name: 'Netherlands', phone_code: '+250')
    end

    it 'returns an array of countries of the name' do
      expect(ShoppingCart::AddressDecorator.countries).to eq([['Ukraine', 1], ['Netherlands', 2]])
    end
  end
end
