all: assets
	GO111MODULE=off $(GOPATH)/bin/goop go build -o bin/build_ruby

setup:
	go get -u github.com/jteeuwen/go-bindata/go-bindata...
	go get -u github.com/karmakaze/goop

test: assets
	$(GOPATH)/bin/goop go test

assets:
	${GOPATH}/bin/go-bindata data/...

clean:
	rm -f bin/*
	rm -f *deb

# Break the rules as goop likes to exit 1 for various upstream reasons that
# won't break the build. Less confusing this way.
deps:
	$(GOPATH)/bin/goop install || true
	mv .vendor/tmp/* .vendor/ || true
	echo "This likes to exit 1 - don't be alarmed, try the build."

update_deps:
	$(GOPATH)/bin/goop update

package:
	$(GOPATH)/bin/goop go build -o /tmp/tmp_build
	GOOS=linux make
	$(eval VERSION = $(shell /tmp/tmp_build -v)) fpm -s dir -t deb -n build_ruby -a amd64 -v ${VERSION} bin
