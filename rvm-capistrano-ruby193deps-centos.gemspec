# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rvm-capistrano-ruby193deps-centos/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Takeshi KOMIYA"]
  gem.email         = ["i.tkomiya@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rvm-capistrano-ruby193deps-centos"
  gem.require_paths = ["lib"]
  gem.version       = Rvm::Capistrano::Ruby193deps::Centos::VERSION
end
