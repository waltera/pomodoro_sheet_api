# frozen_string_literal: true

ruby '2.7.2'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use Postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Simple, Fast, and Declarative Serialization Library for Ruby
gem 'blueprinter'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Centralization of locale data collection for Ruby on Rails
gem 'rails-i18n'

gem 'devise'

gem 'doorkeeper'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop-rails'
  gem 'rubycritic', require: false
  gem 'pry'
end

group :development do
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
