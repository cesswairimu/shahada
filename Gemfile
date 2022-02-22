source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.7.5'
gem 'rails', '~> 5.2.3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'autoprefixer-rails'
gem 'semantic-ui-sass'
gem 'animate-rails'
gem 'font-awesome-rails'
gem "simple_calendar", "~> 2.0"
gem 'carrierwave', '~> 0.11.0'
gem 'mini_magick'
gem 'faker'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_bot_rails', '~> 4.10.0'
  gem 'rspec-rails'
  gem 'pry-rails'
  # gem 'capybara-webkit'
  gem 'timecop'
  gem 'selenium-webdriver', '~>  2.53.4'
  gem 'capybara'
  gem 'sqlite3'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'rails-controller-testing'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'redis-rails'
