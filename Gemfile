source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'pg'
gem 'unicorn', '~> 4.6.3'

gem 'sass-rails'
gem 'coffee-rails'
gem 'therubyracer', :platforms => :ruby
gem 'uglifier'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'devise'
gem 'less-rails-bootstrap'
gem 'simple_form', '~> 3.0.0'
gem 'stripe', '~> 1.8.7'

gem "letter_opener", :group => :development

gem 'savon', '~> 2.0'
gem 'typhoeus'
gem 'sidekiq', '~> 2.15.2'
gem 'sinatra', '>= 1.3.0', :require => nil

gem 'rails_12factor', group: :production
gem 'foreman'
group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'vcr'
  gem 'capybara-webkit', '~> 1.0.0'
  gem 'database_cleaner', '~> 1.1.1'
end

group :test do
  gem 'webmock','>= 1.8.0'
end

# Add these for upgrade
gem 'protected_attributes'
gem 'rails-observers'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'
gem 'activerecord-deprecated_finders'
