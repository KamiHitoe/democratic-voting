#!/bin/sh
set -e

rm -f /app/tmp/pids/server.pid
rails db:create && rails db:migrate && rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

