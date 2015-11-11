#!/bin/bash

set -e


# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p194
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p286
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p327
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p374
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p385
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p392
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p429
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p448
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p484
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p545
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p550
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 1.9.3-p551
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.0.0-p0
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.0.0-p195
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.0.0-p247
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.0.0-p353
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.0.0-p451
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.0.0-p594
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.0.0-p598
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.0.0-p645
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.1.0
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.1.1
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.1.2
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.1.3
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.1.4
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.1.5
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.1.6
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.2.0
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.2.1
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.2.2
# bin/build_ruby -c 8 -d ubuntu:12.04 -a amd64 -i "37s~precise" -r 2.2.3

# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p194
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p286
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p327
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p374
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p385
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p392
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p429
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p448
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p484
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p545
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p550
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 1.9.3-p551
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.0.0-p0
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.0.0-p195
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.0.0-p247
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.0.0-p353
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.0.0-p451
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.0.0-p594
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.0.0-p598
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.0.0-p645
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.1.0
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.1.1
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.1.2
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.1.3
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.1.4
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.1.5
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.1.6
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.2.0
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.2.1
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.2.2
# bin/build_ruby -c 8 -d ubuntu:10.04 -a amd64 -i "37s~lucid" -r 2.2.3

# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p194
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p286
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p327
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p374
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p385
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p392
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p429
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p448
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p484
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p545
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p550
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 1.9.3-p551
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.0.0-p0 # Build with readline patch
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.0.0-p195 # Build with readline patch
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.0.0-p247 # Build with readline patch
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.0.0-p353 # Build with readline patch
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.0.0-p451 # Build with readline patch
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.0.0-p594
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.0.0-p598
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.0.0-p645
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.1.0
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.1.1
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.1.2
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.1.3
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.1.4
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.1.5
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.1.6
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.2.0
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.2.1
# bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.2.2
bin/build_ruby -c 8 -d ubuntu:14.04 -a amd64 -i "37s~trusty" -r 2.2.3

docker rm -v $(docker ps -a -q -f status=exited)
docker rmi $(docker images -f "dangling=true" -q)
