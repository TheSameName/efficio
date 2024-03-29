source "https://rubygems.org"

ruby "3.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1"

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"

# Use postgresql as the database for Active Record
gem "pg"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

gem "dotenv-rails", "~> 2.8", require: "dotenv/rails-now"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]=
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false


gem "solid_queue", "~> 0.1.2"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"
gem "web-console", groups: %i[development]

gem "newrelic_rpm"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]

  gem "rspec-rails", "~> 6.0"
  gem "shoulda-matchers", "~> 5.3"
  gem "factory_bot_rails", "~> 6.2"
  gem "bullet", "~> 7.1"
  gem "annotate", "~> 3.2"
  gem "faker", "~> 3.2"

  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-performance", require: false

  gem "brakeman", require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", "~> 3.3"
  gem "selenium-webdriver", "~> 4.14"
end
