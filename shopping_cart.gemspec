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

  spec.add_dependency 'rails', '~> 5.2.2'

  spec.add_development_dependency 'pg'
end
