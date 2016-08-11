# Build ruby packages

*build_ruby* is a tool for building Ruby packages using Docker. Currently it can build .deb packages for Ubuntu and .rpms for Centos. The packages that it creates will install Ruby to ````/opt/ruby<version>````, eg ````/opt/ruby2.1.0```` or ````/opt/ruby1.9.3-p429````. This is to allow for multiple concurrent installs (that we symlink into the rbenv dir) and is how we install Ruby at [Basecamp](https://basecamp.com/). I have a branch to default to a more traditional path that I might release if anyone is interested.

## Installation

### 1 Install Docker and tools:

#### 1.1 Linux

[Follow the instructions here](http://docs.docker.io/installation/)

#### 1.2 OS X

##### 1.2.1 An existing Docker host somewhere

Advanced usage! If you've got a Docker instance running somewhere already, for instance another server, you need to set these environment variables:

    export DOCKER_CERT_PATH=$HOME/path/to/docker/certs
    export DOCKER_HOST=tcp://192.168.1.79:2376
    export DOCKER_TLS_VERIFY=1

Change as needed. The files required in the certs dir are:

* ca.pem: The ca certificate
* cert.pem: The client certificate
* key.pem: The client key

For simpler usage see section 1.1.2, "Run Docker locally using a VM"

##### 1.2.2 Run Docker locally using a VM

On [this page](http://docs.docker.io/installation/mac/) follow these tasks:

 * Installing VirtualBox
 * Installing docker-machine using HomeBrew

Next, [create and start a docker-machine image](https://docs.docker.com/machine/get-started/)

You can now run docker commands locally on your mac.

#### 1.3 Install pre-requisite tools

    $ make setup

## Running it

### 2. Clone and build this repo

    $ git clone git@github.com:wjessop/build_ruby.git
    $ cd build_ruby
    $ make

## Usage

    $ bin/build_ruby -r 2.1.0 -i 37s~precise -d ubuntu:12.04
    $ bin/build_ruby -r 2.1.0 -d ubuntu:13.04
    $ bin/build_ruby -r 2.1.0

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

    make test

## Troubleshooting

### You get an error ````dial unix /var/run/docker.sock: no such file or directory````

    2014/05/08 21:50:45 dial unix /var/run/docker.sock: no such file or directory

Make sure you ran ````export DOCKER_HOST=tcp://localhost:4243```` in the terminal you are trying to use docker/build_ruby from

## Todo

* Test that a package test is actually created, perhaps requiring Docker to be running
* Support Other Linux distros/package types

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
* [go-bindata Github page](github.com/jteeuwen/go-bindata)

## LICENSE

See LICENSE.md
