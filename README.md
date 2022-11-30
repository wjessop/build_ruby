# Build ruby packages

*build_ruby* is a tool for building Ruby packages using Docker. Currently it can build .deb packages for Ubuntu and .rpms for Centos. The packages that it creates will install Ruby to ````/opt/ruby<version>````, eg ````/opt/ruby2.1.0```` or ````/opt/ruby1.9.3-p429````. This is to allow for multiple concurrent installs (that we symlink into the rbenv dir) and is how we install Ruby at [Basecamp](https://basecamp.com/). I have a branch to default to a more traditional path that I might release if anyone is interested.

## Installation

### 1 Install Docker and tools:

#### 1.1 Linux

[Follow the instructions here to install Docker](http://docs.docker.io/installation/)
[Follow the instructions here to install Go if necessary](https://go.dev/doc/install)

#### 1.2 OS X

[Follow the instructions here to install Docker](https://docs.docker.com/engine/installation/mac/) to install Docker for Mac.

If you need to install `go` on your Mac, best install it through Homebrew:

```
brew install go
go version
```
Please note that in newer installations of Go, `GOPATH` is assumed at your $HOME/go. For this repository to build however, you'll still need to explicitly set the GOPATH variable to run `make`.

```
echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
source ~/.bash_profile
```

#### 1.3 Install work

Follow the [README](https://github.com/basecamp/work#first-time-setup) in order to install `work`.

#### 1.4 Install pre-requisite tools and dependencies

    $ make setup
    $ make deps

## Running it

### 2. Clone and build this repo

    $ work cd build_ruby
    $ make

## Usage

    $ bin/build_ruby -d ubuntu:18.04 -a amd64 -i "37s~bionic" -r 2.4.1
    $ bin/build_ruby -d ubuntu:18.04:libssl -a amd64 -i "37s~bionic.2" -r 3.1.2

### Other options

#### -c, --cpus

Specify the number of CPUs to use in the make process. If omitted defaults to the number of CPUs in your local machine (useful if you're building using a local Docker daemon), but if you're building on a VM, or a remote Docker installation specify this number to match the CPUs available:

    $ bin/build_ruby -r 2.1.0 -c 16
    $ bin/build_ruby -r 2.1.0 --cpus 16

### Building

Just run:

    make

If you need to update the deps run:

    make update_deps

See the Makefile for more functions.

### Testing

_Known to be broken!_

    make test

## Troubleshooting

### You get an error ````dial unix /var/run/docker.sock: no such file or directory````

    2014/05/08 21:50:45 dial unix /var/run/docker.sock: no such file or directory

Make sure you ran ````export DOCKER_HOST=tcp://localhost:4243```` in the terminal you are trying to use docker/build_ruby from

## Errors while running `make`

This repository collects its internal dependencies in `Goopfile.lock`. If you run into issues while running `make`, try upgrading a problematic package to a newer commit SHA. So far, that has helped solve cryptic nested dependency issues.

## Todo

* Test that a package test is actually created, perhaps requiring Docker to be running
* Support Other Linux distros/package types
* Migrate out of `goop` dependency management

## How to contribute

Here's the most direct way to get your work merged into the project:

1. Fork the project
2. Clone down your fork
3. Create a feature branch
4. Add your feature + tests
5. Document new features in the README
6. Make sure everything still passes by running the tests
7. If necessary, rebase your commits into logical chunks, without errors
8. Push the branch up
9. Send a pull request for your branch

Take a look at the TODO list or known issues for some inspiration if you need it, or email me. If you're going to make a major change ask first to maje sure it's in line with the project goals.

## Authors

* [Will Jessop](mailto:will@willj.net)

## Background reading

* [The Docker API docs](http://docs.docker.io/reference/api/docker_remote_api_v1.10/)
* [The Ruby download page](http://docs.docker.io/reference/api/docker_remote_api_v1.10/)
* [The go-dockerclient lib](https://github.com/fsouza/go-dockerclient)
* [go-bindata Github page](https://github.com/kevinburke/go-bindata)

## LICENSE

See LICENSE.md
