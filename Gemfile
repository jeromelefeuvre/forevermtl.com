ruby '2.1.2'
source 'https://rubygems.org'

gem 'rails', '4.1.1'
gem 'pg', :platform => :ruby
gem 'activerecord-jdbcpostgresql-adapter', :platform => :jruby
gem 'hstore_translate'

gem "slim-rails"
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', :group => :doc

gem 'google-analytics-rails'
gem "figaro"
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', :group => :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

gem 'devise'
gem 'activeadmin', :github => 'gregbell/active_admin'
gem 'active_admin_importable'

gem 'rails-i18n', '~> 4.0.0'
gem 'carrierwave'
gem "fog"
gem "mini_magick"

gem 'paper_trail', '~> 3.0.2'
gem 'localeapp'
gem 'ckeditor'
gem "twitter-bootstrap-rails"

group :development, :test do
  gem 'thin'
  gem 'better_errors'
  gem "binding_of_caller"

  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem "bundler"
  gem "jeweler", "> 1.6.4"
  # gem 'i18n-spec'

  gem 'hirb'
  gem 'bullet'
end

group :test, :darwin do
  gem 'rb-fsevent'
end

group :production do
  # https://devcenter.heroku.com/articles/ruby-support#injected-plugins
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

