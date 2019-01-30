# frozen_string_literal: true

FactoryBot.define do
  factory :delivery, class: 'ShoppingCart::Delivery' do
    name { "Delivery#{('a'..'z').to_a.sample(3).join}" }
    terms { "#{rand(1..3)} to #{rand(4..10)} day" }
    price { rand(0.1..100).round(2) }
  end
end
