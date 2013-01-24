# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_tag_silent_alt/version'

Gem::Specification.new do |gem|
  gem.name          = "image_tag_silent_alt"
  gem.version       = ImageTagSilentAlt::VERSION
  gem.authors       = ["Philip Hallstrom"]
  gem.email         = ["philip@pjkh.com"]
  gem.description   = %q{Set an image's alt attribute to a blank string by default.}
  gem.summary       = %q{Set an image's alt attribute to a blank string by default.}
  gem.homepage      = "https://github.com/phallstrom/image_tag_silent_alt"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
