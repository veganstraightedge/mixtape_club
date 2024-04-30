max_threads_count = ENV.fetch('RAILS_MAX_THREADS') { 5 }
min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { 1 }
threads min_threads_count, max_threads_count

# in production, use make as many Puma workers as the number of processors
if ENV['RAILS_ENV'] == 'production'
  require 'concurrent-ruby'
  worker_count = Integer(ENV.fetch('WEB_CONCURRENCY') { Concurrent.physical_processor_count })
  workers worker_count if worker_count > 1
end

# in development, Puma will terminate workers after 1 minute
worker_timeout 3600 if ENV.fetch('RAILS_ENV', 'development') == 'development'

port        ENV.fetch('PORT') { 3000 }
environment ENV.fetch('RAILS_ENV') { 'development' }
pidfile     ENV.fetch('PIDFILE') { 'tmp/pids/server.pid' }
plugin      :tmp_restart

wait_for_less_busy_worker
fork_worker

before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

plugin :tmp_restart
