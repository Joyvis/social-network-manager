source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'dotenv-rails', '~> 2.7.6'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.4'
gem 'redis', '~> 4.0'
gem 'redis-rails', '~> 5.0.2'
gem 'rest-client', '~> 2.1.0'
gem 'sidekiq', '~> 6.2.1'
gem 'whenever', '~> 1.0.0'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-highlight'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
