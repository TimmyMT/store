source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.7', '>= 6.1.7.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'

gem 'grape'
gem 'grape_on_rails_routes'
gem 'multi_json'

gem 'rswag'
gem 'active_model_serializers'
gem 'grape-active_model_serializers'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
