#!/bin/sh

set -e
set -o verbose

export DOCKER_CERT_PATH=$HOME/www/go/src/github.com/wjessop/build_ruby
export DOCKER_HOST=tcp://192.168.1.79:2376
export DOCKER_TLS_VERIFY=1
