source 'http://rubygems.org'

gem 'rails', '3.1.1'

group :development do
  gem "sqlite3"
  gem 'rspec-rails', '2.8.1'
end

gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'sass-rails', '~> 3.1.4'

group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
	gem 'rake' # needed to run CI box with Travis
	gem 'capybara', '1.1.2'
  gem 'spork', '~> 0.9.0.rc'
	gem 'factory_girl_rails', '1.4.0'
end

group :production do
  gem "pg"
end
