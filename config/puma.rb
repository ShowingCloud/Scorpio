threads 0,16
workers 1
preload_app!

environment 'production'
daemonize
pidfile '/var/www/rails/novasol/production/tmp/pids/puma.pid'
state_path '/var/www/rails/novasol/production/tmp/pids/puma.state'
stdout_redirect '/var/www/rails/novasol/production/log/stdout', '/var/www/rails/novasol/production/log/stderr', true

bind 'tcp://0.0.0.0:3200'
tag 'Novasol Production'
