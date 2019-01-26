# frozen_string_literal: true

ShoppingCart::Engine.routes.draw do
  scope '(:locale)', locale: Regexp.new(I18n.available_locales.join('|')) do
    resources :orders, only: %i[index show]
    resource :cart, only: %i[show update]
    resources :order_items, only: %i[create update destroy]
    resources :checkouts
  end
end
