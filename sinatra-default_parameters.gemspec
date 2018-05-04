# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sinatra/default_parameters/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Iain Barnett"]
  gem.email         = ["iainspeed@gmail.com"]
  gem.description   = %q{A quick and simple way to set defaults for the params helper on a per route basis.}
  gem.summary       = %q{Extends the request context with a helper to give a quick and simple way to set defaults for the params helper on a per route basis.}
  gem.homepage      = "https://github.com/yb66/sinatra-default_parameters"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sinatra-default_parameters"
  gem.require_paths = ["lib"]
  gem.version       = Sinatra::DefaultParameters::VERSION
  gem.add_dependency("sinatra", ">=1.3")
end
