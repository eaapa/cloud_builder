# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloud_builder/version'

Gem::Specification.new do |gem|
  gem.name          = "cloud_builder"
  gem.version       = CloudBuilder::GEM_VERSION
  gem.authors       = ["Sorin Stoiana"]
  gem.email         = ["sstoiana@optaros.com"]
  gem.description   = "Generate JSON config for AWS CloudFormation using a Ruby based DSL"
  gem.summary       = "Generate JSON config for AWS CloudFormation"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_development_dependency "netaddr"
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "guard-rspec"
  
  gem.add_dependency "clamp"
  gem.add_dependency "json"
  gem.add_dependency "aws-sdk"
  gem.add_dependency "activesupport"
end
