# Rvm::Capistrano::Ruby193deps::Centos

Capistrano task to install build-dependencies of Ruby 1.9.3 for CentOS 5.x and 6.x

## Installation

Add this line to your application's Gemfile:

    gem 'rvm-capistrano-ruby193deps-centos'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rvm-capistrano-ruby193deps-centos

## Usage

load rvm-capistrano-ruby193deps-centos in your config/deploy.rb:

    require 'rvm-capistrano-ruby193deps-centos'

And then, rvm-capistrano-ruby193deps-centos runs before rvm:install_ruby task,
and install build-dependencies of ruby1.9.3.

So, you can install ruby 1.9.3 with very simple configuration:

    require 'rvm-capistrano'
    require 'rvm-capistrano-ruby193deps-centos'
    set :rvm_ruby_string , "ruby-1.9.3-p374@#{application}"
    before 'deploy:setup', 'rvm:install_rvm'
    before 'deploy:setup', 'rvm:install_ruby'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
