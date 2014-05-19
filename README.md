# Build ruby debs for ubuntu targets

*build_ruby* is a tool for building Ruby packages using Docker. Currently it builds only .deb packages for Ubuntu. The debs that it creates will install Ruby to ````/opt/ruby<version>````, eg ````/opt/ruby2.1.0```` or ````/opt/ruby1.9.3-p429````. This is to allow for multiple concurrent installs (that we symlink into the rbenv dir) and is how we install Ruby at [Basecamp](https://basecamp.com/). If you need Ruby in another location submit a pull request.

## Installation

### 1. Install Docker:

#### Linux

[Follow the instructions here](http://docs.docker.io/installation/)

#### OS X

On [this page](http://docs.docker.io/installation/mac/) follow these tasks:

 * Installing VirtualBox
 * Installing boot2docker with Homebrew

Next run:

    $ boot2docker init
    $ boot2docker up

You will get a message like this:

    To connect the docker client to the Docker daemon, please set:
    export DOCKER_HOST=tcp://localhost:4243

Run the export you are given. Now run this command (may take a few minutes):

    boot2docker down
    for i in {49000..49900}; do
     VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$i,tcp,,$i,,$i";
     VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$i,udp,,$i,,$i";
    done

Now start the boot2docker image:

    $ boot2docker start

You can now run docker commands locally on your mac.

### 2. Clone and build this repo

    $ git clone git@github.com:wjessop/build_ruby.git
    $ cd build_ruby
    $ go build

## Usage

    $ ./build_ruby -r 2.1.0 -i 37s~precise -d ubuntu:12.04
    $ ./build_ruby -r 2.1.0 -d ubuntu:13.04
    $ ./build_ruby -r 2.1.0

## Developing

Developing for build_ruby should be fairly straightforward if you have Docker installed. The only complication is if you change any files in data/, then you will need to re-run the go-bindata command, and that needs installing first:

### Installing go-bindata

The instructions on [the go-bindata github repo](https://github.com/jteeuwen/go-bindata) don't seem accurate (ir at least I couldn't get them to work as advertised) so if you need to install it follow this procedure:

1. ````go get github.com/jteeuwen/go-bindata````
2. cd to the right dir: ````cd $GOPATH/src/github.com/jteeuwen/go-bindata/go-bindata````
3. Build it: ````go build````

You can now run the command directly to re-build the bindata:

    $GOPATH/src/github.com/jteeuwen/go-bindata/go-bindata/go-bindata data/...

or copy it into your path then run it:

    go-bindata data/...

### Testing

    go test

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
