source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'
gem 'rails', '~> 5.2.0'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'foundation-rails'
gem 'autoprefixer-rails'
gem 'animate-rails'
gem 'font-awesome-rails'
gem "simple_calendar", "~> 2.0"

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'carrierwave', '~> 0.11.0'
  gem 'mini_magick', '3.8.0'
  gem "factory_girl_rails", "~> 4.0"
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'capybara-webkit'
  gem 'timecop'
  gem 'selenium-webdriver', '~>  2.53.4'
  gem 'capybara'

end
group :test do
  gem 'cucumber-rails', :require => false
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda'
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
