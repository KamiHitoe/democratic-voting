#!/bin/sh
set -e

rm -f /app/tmp/pids/server.pid
rails db:create RAILS_ENV=production && rails db:migrate RAILS_ENV=production && rails db:seed RAILS_ENV=production

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

