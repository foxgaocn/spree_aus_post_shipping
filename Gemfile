source 'http://rubygems.org'

gem 'spree', :path => "../spree"

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end

group :test do
  # without ffaker in test it wont init
  # https://github.com/spree/spree/pull/833
  gem 'ffaker'
  gem 'shoulda-matchers'
  gem 'guard-rspec'
end

gemspec
