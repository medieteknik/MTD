source 'https://rubygems.org'
# set ruby version
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
# handle internationalization of db
gem 'globalize', '~> 5.0.0'
gem 'globalize-versioning', '~> 0.1.0' # so we can use paper_trail!
gem 'globalize-accessors' # edit multiple locales at the same time
# handle news version
gem 'paper_trail', '~> 3.0.6'
# pagination!
gem 'will_paginate', '~> 3.0.6'

# websockets!
gem 'websocket-rails'

# handle secrets nicely
gem 'figaro'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

## Front end stuff
gem 'bootstrap-sass', '~> 3.3.0.1'
gem 'font-awesome-sass', '4.3.1'
gem 'bourbon'
# setup font assets origin control without hassle
gem 'font_assets'
# turbolinks creates the need for a loading indicator
gem 'nprogress-rails', '~> 0.1.6.3'

# add vendor prefixes without hassle
gem 'autoprefixer-rails'

# use semantic ui > 1.0 for admin interface
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass', branch: 'v1.0beta'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# make sure events jquery rely on works
gem 'jquery-turbolinks'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# angular es nice
gem 'angularjs-rails', '~> 1.3.10'

# user handeling with devise
gem 'devise', '~> 3.4.1'
# user level handeling with the not-dead CanCanCan clone of CanCan
gem 'cancancan', '~> 1.9'

# International urls
gem 'route_translator'

# setup simple sitemap handeling
gem 'sitemap_generator'
gem 'fog'
# use whenever to schedule sitemap refreshing
gem 'whenever', :require => false
# render pages and news with github flavored markdown
gem 'github-markdown', '~> 0.6.7'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

## File uploads
# amazon sdk
gem 'aws-sdk', '< 2'
# direct upload form helper and assets
gem 's3_direct_upload'

# image manipulation
gem 'mini_magick'

## DEVELOPMENT TOOLS
group :development do
  # a set of debugging tools for your Rails application
  gem 'web-console', '~> 2.0'
  # replaces the standard Rails error page with a much better and more useful error page
  gem 'better_errors'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Intercept email sending and show email in browser
  gem 'letter_opener'
  # neat debug tool
  gem 'byebug'
end

## Heroku/deployment stuff
# Use puma as the app server
gem 'puma'
group :production do
  # heroku wants this to be here
  gem 'rails_12factor'
  # gzip them assets
  gem 'heroku-deflater'
  # minify dat html
  gem 'htmlcompressor'
  # use newrelic to measure performance
  gem 'newrelic_rpm'
end
