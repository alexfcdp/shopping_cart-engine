# frozen_string_literal: true

FactoryBot.define do
  factory :product, class: 'Book' do
    title { FFaker::Book.unique.title }
    description { FFaker::Book.description }
    price { rand(3.5..100).round(2) }
  end
end
