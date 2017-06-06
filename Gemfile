source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'rails_12factor'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'rails-i18n'
gem 'rspec-rails'
gem 'uglifier'
gem 'jquery-rails'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'sqlite3'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
