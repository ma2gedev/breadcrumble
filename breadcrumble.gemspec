# -*- encoding: utf-8 -*-
require File.expand_path('../lib/breadcrumble/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["ma2ge"]
  gem.email         = ["takayuki.1229@gmail.com"]
  gem.description   = "A breadcrumbs plugin for Ruby on Rails 3."
  gem.summary       = "Breadcrumble is a simple breadcrumb navigation plugin for Ruby on Rails 3."
  gem.homepage      = "https://github.com/ma2gedev/breadcrumble"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "breadcrumble"
  gem.require_paths = ["lib"]
  gem.version       = Breadcrumble::VERSION

  gem.add_dependency "rails", ['>= 4.0.0.beta1']
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "rspec-rails"
end
