# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'shopping_cart/version'

Gem::Specification.new do |spec|
  spec.name        = 'shopping_cart'
  spec.version     = ShoppingCart::VERSION
  spec.authors     = ['Aleksandr Khomakha']
  spec.email       = ['alexfcdp@gmail.com']
  spec.homepage    = 'https://github.com/alexfcdp/shopping_cart-engine'
  spec.summary     = 'Summary of ShoppingCart.'
  spec.description = 'Description of ShoppingCart.'
  spec.license     = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  spec.test_files = Dir['spec/**/*']

  spec.add_dependency 'bootstrap-sass'
  spec.add_dependency 'cancancan'
  spec.add_dependency 'coffee-rails'
  spec.add_dependency 'devise'
  spec.add_dependency 'draper'
  spec.add_dependency 'jbuilder'
  spec.add_dependency 'jquery-rails'
  spec.add_dependency 'jquery-turbolinks'
  spec.add_dependency 'puma'
  spec.add_dependency 'rails', '~> 5.2.2'
  spec.add_dependency 'sass-rails'
  spec.add_dependency 'slim'
  spec.add_dependency 'slim-rails'
  spec.add_dependency 'turbolinks'
  spec.add_dependency 'uglifier'
  spec.add_dependency 'wicked'

  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'chromedriver-helper'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'ffaker'
  spec.add_development_dependency 'letter_opener'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'rails-controller-testing'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'selenium-webdriver'
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'webdrivers'
end
