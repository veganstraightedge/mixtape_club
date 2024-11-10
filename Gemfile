source 'https://rubygems.org'

ruby file: '.ruby-version'

# app server
gem 'bootsnap', require: false
gem 'rails', '~> 7.2.0'

# database
gem 'pg'

# webserver
gem 'puma'

# UI framework getbootstrap.com
gem 'bootstrap'
gem 'bootstrap-icons-helper'
gem 'sassc-rails'

# JS hotwired.dev
gem 'importmap-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# JSON views
gem 'jbuilder'

# text utilities
gem 'addressable'      # for current URL with a subdomain
gem 'kramdown'         # for Markdown processing
gem 'markdown_media'   # for [[ media embeds ]]
gem 'pandoc-ruby'      # for Word to HTML conversion
gem 'reverse_markdown' # for HTML to Markdown conversion
gem 'rubypants'        # for smart quotes
gem 'sterile'          # for slugs
gem 'stringex'         # for Markdown header IDs processing

# authentication
gem 'devise'
gem 'valid_email2' # validates user's email

# pagination
gem 'kaminari'

# uploads using Active Storage
gem 'aws-sdk-s3', require: false
gem 'image_processing'
gem 'ruby-vips'

# job queue using Active Job
gem 'sidekiq'

# i18n
gem 'rack-contrib'

# dev and testing
group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'debug', platforms: %i[mri windows]
  gem 'dotenv-rails'
  gem 'erb_lint', require: false
  gem 'factory_bot_rails'
  gem 'fasterer', require: false
  gem 'http'
  gem 'i18n-debug'
  gem 'overcommit'
  gem 'rails-erd'
  gem 'rspec-rails'
  gem 'selenium-webdriver'

  # code linting and formatting
  gem 'rubocop',               require: false
  gem 'rubocop-capybara',      require: false
  gem 'rubocop-factory_bot',   require: false
  gem 'rubocop-i18n',          require: false
  gem 'rubocop-md',            require: false
  gem 'rubocop-performance',   require: false
  gem 'rubocop-rails',         require: false
  gem 'rubocop-rspec',         require: false
  gem 'rubocop-rspec_rails',   require: false
  gem 'rubocop-thread_safety', require: false
end

# windows dev
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
