source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Rails, MySQL, Puma
gem 'rails', '~> 5.2.0'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'

# Rails Dependencies
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# loads rails apps faster 
gem 'bootsnap', '>= 1.1.0', require: false

# active model time savers
gem "validate_url"

# interface items
gem 'carrierwave', '~> 1.2', '>= 1.2.3'
gem 'mini_magick'

# cas client
gem 'rack-cas', '~> 0.16.0'

# frontend
# gem 'bourbon'
# gem 'neat'
# gem 'bitters'
gem 'normalize-scss'
gem 'font-awesome-sass'

# development and testing
group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem "factory_bot_rails"
  gem 'database_cleaner'
  gem 'simplecov'
  gem 'simplecov-console'
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver', '~> 3.14'  
  gem 'capybara-webkit'
  gem 'chromedriver-helper'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] # from rails new
  gem 'pry'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]