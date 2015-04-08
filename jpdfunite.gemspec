# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jpdfunite/version'

Gem::Specification.new do |spec|
  spec.name          = "jpdfunite"
  spec.version       = Jpdfunite::VERSION
  spec.authors       = ["Ricardo Piro-Rael"]
  spec.email         = ["fdisk@fdisk.co"]
  spec.summary       = %q{This gem provides a shell interface to pdfunite and jpdfbookmarks.}
  spec.description   = %q{Requires Java and poppler-utils}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "shellwords"
  spec.add_development_dependency "tempfile"
  spec.add_development_dependency "pathname"
end
