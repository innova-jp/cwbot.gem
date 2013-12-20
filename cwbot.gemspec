# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cwbot/version'

Gem::Specification.new do |spec|
  spec.name          = "cwbot"
  spec.version       = Cwbot::VERSION
  spec.authors       = ["murapi0227"]
  spec.email         = ["murapi@gmail.com"]
  spec.description   = %q{Chatwork API wraped by ruby}
  spec.summary       = %q{chatwork api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
