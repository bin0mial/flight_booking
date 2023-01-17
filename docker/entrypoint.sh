#!/bin/bash

set -xe;

bundle install

rm -rf ${APP_PATH}/tmp/pids/server.pid;

# any initializing commands
rails db:create

echo '[+] starting up...'

exec "$@"