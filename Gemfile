source 'https://rubygems.org'
ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use PG as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Bootstrap
gem 'twitter-bootstrap-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracerrake ', platforms: :ruby

gem 'haml-rails'

# Login with facebook
gem 'omniauth-facebook'

# Image uploading
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
# Image processing
gem 'mini_magick'
# Image uploading to Amazon S3
gem 'fog-aws'
# Image file size validation
gem 'file_validators'

# Error detection in production
gem 'airbrake'
# Full-fledged user authentication system
gem 'devise'
# Geocode for residences and searchs
gem 'geocoder'
# Better seed management
gem "seedbank"

# Local variables
gem 'dotenv-rails', :groups => [:development, :test]

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Used to collect tests metadata for circleci tests
gem 'rspec_junit_formatter', '0.2.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'rspec-rails'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
end

group :development do
  # To export database as image
  gem 'roadie-rails'
  # Annotations in models
  gem 'annotate'

  gem 'guard-rspec'
  gem 'guard-livereload'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'webmock'
end