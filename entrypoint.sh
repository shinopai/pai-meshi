#!/bin/bash
set -e

rm -f /pai-meshi/tmp/pids/server.pid

exec "$@"
