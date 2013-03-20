source 'https://rubygems.org'

ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.beta1'
gem 'thin'
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails',   '~> 4.0.0.beta1'

group :heroku, :assets do
  gem 'coffee-rails', '~> 4.0.0.beta1'
  gem 'bourbon'
  gem 'neat'
  gem 'uglifier', '>= 1.0.3'
end

gem 'normalize-rails'
gem 'jquery-rails'

# # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

gem 'cancan'
gem 'rails-observers'

gem 'thor'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'api_taster'
end

group :heroku do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end
