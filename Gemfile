source 'https://rubygems.org'

ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.beta1'
gem 'thin'
gem 'pg'
gem 'sass-rails',   '~> 4.0.0.beta1'
gem 'normalize-rails'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.0.1'
gem 'cancan'
gem 'rails-observers'
gem 'thor'
gem 'twitter'
gem 'typhoeus'
gem 'draper'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'api_taster'
end

group :heroku, :assets do
  gem 'coffee-rails', '~> 4.0.0.beta1'
  gem 'bourbon'
  gem 'neat'
  gem 'uglifier', '>= 1.0.3'
end

group :heroku do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end
