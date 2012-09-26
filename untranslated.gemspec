# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'untranslated/version'

Gem::Specification.new do |gem|
  gem.name          = "untranslated"
  gem.version       = Untranslated::VERSION
  gem.authors       = ["Heimdell"]
  gem.email         = ["hindmost.one@gmail.com"]
  gem.description   = "This gem sniffers your untranslated keys and store them as they come to ./log"
  gem.summary       = "Detector of untranslated keys."
  gem.homepage      = ""

  gem.add_dependency "i18n"
  gem.add_dependency "hash-deep-merge"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec|spec|features)/})
  gem.require_paths = ["lib"]
end
