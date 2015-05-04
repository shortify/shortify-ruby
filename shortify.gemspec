# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shortify/version"

Gem::Specification.new do |spec|
  spec.name          = "shortify"
  spec.version       = Shortify::VERSION
  spec.authors       = ["pseudomuto"]
  spec.email         = ["david.muto@gmail.com"]

  spec.summary       = "A ruby library for working with Shortify"
  spec.description   = "A ruby library for working with Shortify"
  spec.homepage      = "https://github.com/shortify/shortify-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rubocop", "~> 0.30"
  spec.add_development_dependency "vcr", "~> 2.9"
  spec.add_development_dependency "webmock", "~> 1.21"

  spec.add_dependency "httparty"
end
