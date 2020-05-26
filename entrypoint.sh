#!/bin/bash
set -ex

rm -f /marumie_light/tmp/pids/server.pid

exec "$@"