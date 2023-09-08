source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.7'

gem 'rails', '~> 5.2.2'
gem 'pg', '1.1.3'
gem 'puma', '~> 3.11'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jbuilder'
gem 'turbolinks'

gem 'http'
gem 'parallel'
gem 'bootsnap', '>= 1.1.0', require: false

gem 'devise'
gem 'toastr-rails'
gem 'jquery-rails'
gem 'cancancan'
gem 'simple_form'
gem 'ransack'
gem 'whenever', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rspec-rails', '~> 3.9.1'
  gem 'ffaker', '~> 2.18.0'
  gem 'dotenv-rails'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'yard'
end

group :test do
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'webmock'
  gem 'simplecov', '~> 0.21.2', require: false
end
