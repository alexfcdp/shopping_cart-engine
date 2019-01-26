Rails.application.routes.draw do
  scope '(:locale)', locale: Regexp.new(I18n.available_locales.join('|')) do
    devise_for :users
    resources :books
    mount ShoppingCart::Engine => '/'
  end
end
