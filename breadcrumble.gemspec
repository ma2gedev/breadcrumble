# -*- encoding: utf-8 -*-
require_relative 'lib/breadcrumble/version'

Gem::Specification.new do |gem|
  gem.authors       = ["ma2ge"]
  gem.email         = ["takayuki.1229@gmail.com"]
  gem.description   = "A breadcrumbs plugin for latest Ruby on Rails."
  gem.summary       = "Breadcrumble is a simple breadcrumb navigation plugin for latest Ruby on Rails."
  gem.homepage      = "https://github.com/ma2gedev/breadcrumble"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^exe/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "breadcrumble"
  gem.version       = Breadcrumble::VERSION

  gem.add_dependency "rails", ['>= 5.2.0']
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "rspec-rails", '~> 3.0'
  gem.add_development_dependency "coveralls_reborn"
end
