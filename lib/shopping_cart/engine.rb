# frozen_string_literal: true

require 'cancancan'
require 'devise'
require 'draper'
require 'jquery-rails'
require 'jquery-turbolinks'
require 'puma'
require 'sass-rails'
require 'slim'
require 'slim-rails'
require 'turbolinks'
require 'wicked'
require 'uglifier'
require 'coffee-rails'
require 'coffee-rails'
require 'jbuilder'
require 'bootstrap-sass'

module ShoppingCart
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingCart
    config.autoload_paths << File.expand_path('lib/some/path', __dir__)
    config.generators do |g|
      g.orm :active_record
      g.template_engine :slim
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
