# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods/app_group/version'

Gem::Specification.new do |spec|
  spec.name          = "cocoapods-app_group"
  spec.version       = Cocoapods::AppGroup::VERSION
  spec.authors       = ["mzp"]
  spec.email         = ["mzpppp@gmail.com"]

  spec.summary       = "Customizable app group plugin"
  spec.description   = "Because app group is strong bound to AppleID, it is hard to distribute iOS project using app group. This plugin enable each user to customize app group name at setup phase. This make easy to distribute your iOS project."
  spec.homepage      = "https://github.com/mzp/cocoapods-app_group"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
