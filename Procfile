release: bundle exec rake db:migrate
web:     bundle exec rails server
console: bundle exec rails console
worker:  worker: RAILS_MAX_THREADS=${SIDEKIQ_RAILS_MAX_THREADS} bundle exec sidekiq -q default -q mailers -q active_storage_analysis -q active_storage_purge
