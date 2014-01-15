# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'better_puts/version'

Gem::Specification.new do |spec|
  spec.name          = "better_puts"
  spec.version       = BetterPuts::VERSION
  spec.authors       = ["Federico Dayan"]
  spec.email         = ["federico.dayan@gmail.com"]
  spec.description   = %q{Better puts for debuging}
  spec.summary       = %q{Better puts for debuging}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "rainbow","~> 1.99.1"
end
