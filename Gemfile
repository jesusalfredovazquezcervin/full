source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.2'
gem 'bootstrap-sass', '3.3.0.0'
gem 'font-awesome-rails', '4.3.0.0'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

#Manage images
gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"
gem 'imagemagick-identify', '~> 0.0.1'
gem "gon"
gem 'jquery-rails'

group :development do
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails', '~> 1.1.3'
  gem 'capistrano-rbenv', '~> 2.0.3'
  gem 'capistrano-passenger'
  gem 'capistrano-figaro-yml', '~> 1.0.2'

  #Dependencias de roadie
  gem 'rspec', '~> 3.4'
  gem 'rspec-collection_matchers', '~> 1.1', '>= 1.1.2'
  gem 'webmock', '~> 1.24'

  #dependencias de exception notification
  gem 'appraisal', '~> 1.0.0'
  gem 'coveralls', '~> 0.8.2'
  gem 'mocha', '>= 0.13.0'
end


#Authentication
gem 'devise', '~> 3.5.6'

#Variables de entorno ENV[myvar]
gem 'figaro', '~> 1.1.1'

#Authentication with roles
gem 'cancan', '~> 1.6', '>= 1.6.10'
gem 'rails-i18n', '~> 4.0', '>= 4.0.8'

group :runtime, :test do
  gem 'css_parser', '~> 1.3', '>= 1.3.7'
  gem 'nokogiri', '~> 1.6', '>= 1.6.7.2'

  #la pide exception_notification
  #gem 'activesupport', '~> 4.2', '>= 4.2.6'
end


#Envio de correos css inline
#gem 'actionview'
gem 'actionpack'
gem 'actionmailer', '~> 4.1.2'
gem 'roadie', '~> 3.1', '>= 3.1.1'
gem 'exception_notification'




