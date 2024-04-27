source 'https://rubygems.org'

ruby File.read('.ruby-version').chomp

# app server
gem 'rails'
gem 'bootsnap', require: false

# database
gem 'pg'

# webserver
gem 'puma'

# assets
gem 'bootstrap'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'

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

# auth
gem 'bcrypt'

# pagination
gem 'kaminari'

# uploads using Active Storage
gem 'aws-sdk-s3'
gem 'image_processing'

# syndication
gem 'down' # downloading images from ActiveStorage/S3

# job queue using Active Job
gem 'sidekiq'

# i18n
gem 'rack-contrib'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# dev and testing
group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capybara'
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

  # codestyle guide and linting
  gem 'rubocop', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri windows ]
end

# windows dev
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
