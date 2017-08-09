source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# Authentication and authorization
gem 'devise'
gem 'cancancan'

# Database stuff
gem 'pg'
gem 'annotate'

# Use Puma as the app server
gem 'puma', '~> 3.0'
gem 'eye', require: false
gem 'dotenv-rails', require: 'dotenv/rails-now'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'haml-rails'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# combine @media query rules and keep them at the bottom if final css
gem 'sprockets-media_query_combiner'

# Nice and useful
gem 'flutie'
gem 'spreadsheet'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :staging, :production do
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-eye', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
