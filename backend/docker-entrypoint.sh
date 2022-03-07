#!/bin/sh
set -e

rm -f /app/tmp/pids/server.pid

# 2回目以降のpushでは不要
rails db:create db:migrate db:seed RAILS_ENV=production
# rails db:create && rails db:migrate:reset && rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

