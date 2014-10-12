# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'actn/api/version'

Gem::Specification.new do |spec|
  spec.name          = "actn-api"
  spec.version       = Actn::Api::VERSION
  spec.authors       = ["Onur Uyar"]
  spec.email         = ["me@onuruyar.com"]
  spec.summary       = %q{Actn.io API}
  spec.homepage      = "https://github.com/hackberry-gh/actn-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "em-http-request"
  
  spec.add_dependency "oj"  
  spec.add_dependency "goliath"
  spec.add_dependency "rack_csrf"  
  spec.add_dependency "tilt"  
  spec.add_dependency "helmet"

  
  # spec.add_dependency 'actn-db', '~> 0.0.4'
  # spec.add_dependency 'actn-jobs', '~> 0.0.4'
end
