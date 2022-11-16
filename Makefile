all: assets
	GO111MODULE=off $(GOPATH)/bin/goop go build -o bin/build_ruby

setup:
	brew install go-bindata
	go install github.com/karmakaze/goop@latest

test: assets
	$GOPATH/bin/goop go test

assets:
	go-bindata data/...

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
