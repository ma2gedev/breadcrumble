# -*- encoding: utf-8 -*-
require File.expand_path('../lib/breadcrumble/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["ma2ge"]
  gem.email         = ["takayuki.1229@gmail.com"]
  gem.description   = "A breadcrumbs plugin for Ruby on Rails 4.0, 4.1 and 4.2."
  gem.summary       = "Breadcrumble is a simple breadcrumb navigation plugin for Ruby on Rails 4.0, 4.1 and 4.2."
  gem.homepage      = "https://github.com/ma2gedev/breadcrumble"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "breadcrumble"
  gem.require_paths = ["lib"]
  gem.version       = Breadcrumble::VERSION

  gem.add_dependency "rails", ['>= 4.0.0']
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "rspec-rails", '~> 3.0'
  gem.add_development_dependency "rr"
  gem.add_development_dependency "coveralls"
end
