# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "usecasing-rails"
  gem.version       = '0.0.3'
  gem.authors       = ["Thiago Dantas"]
  gem.email         = ["thiago.teixeira.dantas@gmail.com"]
  gem.description   = %q{Usecase Rails Generator}
  gem.summary       = %q{UseCase Rails Generator}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake', '10.1.0'
  gem.add_development_dependency 'rails', '3.2.16'
  gem.add_development_dependency 'rspec', '2.14.1'
  gem.add_development_dependency 'aruba', '0.5.3'
  gem.add_development_dependency "bundler", '1.2.3'


  gem.add_runtime_dependency   'usecasing', '0.0.1'

end
