# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proto_config/version'

Gem::Specification.new do |spec|
  spec.name          = "proto_config"
  spec.version       = ProtoConfig::VERSION
  spec.authors       = ["Brian McNabb"]
  spec.email         = ["brian.d.mcnabb@gmail.com"]
  spec.description   = %q{Coordinate a group of objects with a single configuration}
  spec.summary       = %q{Coordinate a group of objects with a single configuration}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
