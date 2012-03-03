source 'http://rubygems.org'

gem 'rails', '3.1.1'

group :development do
  gem "sqlite3"
  gem 'rspec-rails', '2.8.1'
end

gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre'
gem 'bcrypt-ruby', '~> 3.0.0'

group :assets do
  gem 'sass-rails', '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
	gem 'rake' # needed to run CI box with Travis
end

group :production do
  #gems specifically for Heroku go here
  gem "pg"
end
