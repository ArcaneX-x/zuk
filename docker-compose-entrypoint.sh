#!/bin/bash
set -e

bundle exec rake db:create
bundle exec rake db:migrate

exec bundle exec "$@"
