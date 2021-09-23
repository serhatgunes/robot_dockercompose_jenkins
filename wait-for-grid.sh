#!/bin/bash
# wait-for-grid.sh

set -e

cmd="$@"

echo "Waiting for selenium hub server response"
timeout 300 bash -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:4444)" != '200' ]]; do sleep 5; done' || false
sleep 15 s

>&2 echo "Selenium Hub is up - executing tests"
exec $cmd