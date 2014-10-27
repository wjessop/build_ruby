package main

import (
	"archive/tar"
	"bytes"
	"fmt"
	"github.com/stretchr/testify/assert"
	"io/ioutil"
	"path/filepath"
	"testing"
)

/*

	Unit tests. Skipped the tests that would have required mocking the Docker API
	for now, may make them actually create package files.

*/

func Test_majorMinorVersionOnly(t *testing.T) {
	assert.Equal(t, majorMinorVersionOnly("2.1.34"), "2.1")
	assert.Equal(t, majorMinorVersionOnly("1.9.3-p635"), "1.9")
}

func Test_rubyDownloadUrl(t *testing.T) {
	assert.Equal(t, rubyDownloadUrl("2.1.34"), "http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.34.tar.gz")
	assert.Equal(t, rubyDownloadUrl("2.0.34-p451"), "http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.34-p451.tar.gz")
}

// Could do with pushing this out to go-bindata or similar
func Test_dockerFileFromTemplate(t *testing.T) {
	dockerfile_putput := fmt.Sprintf(`FROM ubuntu:12.04
RUN apt-get update
RUN apt-get install -y ruby1.9.3 build-essential \
    libc6-dev libffi-dev libgdbm-dev libncurses5-dev \
    libreadline-dev libssl-dev libyaml-dev zlib1g-dev \
    curl
RUN ["/usr/bin/gem", "install", "fpm", "--bindir=/usr/bin", "--no-rdoc", "--no-ri"]
RUN curl http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.34.tar.gz|tar oxzC /tmp
WORKDIR /tmp/ruby-2.1.34
RUN CFLAGS='-march=x86-64 -O3 -fno-fast-math -g3 -ggdb -Wall -Wextra -Wno-unused-parameter -Wno-parentheses -Wno-long-long -Wno-missing-field-initializers -Wunused-variable -Wpointer-arith -Wwrite-strings -Wdeclaration-after-statement -Wimplicit-function-declaration -Wdeprecated-declarations -Wno-packed-bitfield-compat -std=iso9899:1999  -fPIC' ./configure \
  --prefix=/opt/ruby2.1.34 \
  --enable-shared \
  --disable-install-doc \
  --enable-load-relative
# Seems to only affect some 1.9 series Rubies, but the combined make step:
#
#     RUN make -j8 install DESTDIR=/tmp/fpm
#
# that rane the make then make install, was broken. Splitting it up into
# two separate commands works fine:
RUN make -j%d
RUN make install DESTDIR=/tmp/fpm

WORKDIR /
RUN fpm \
    -s dir \
    -t deb \
    -n ruby-2.1.34 \
    -a amd64 \
    -v 2.1.34 \
    --iteration 37s~precise \
    -d libc6-dev \
    -d libffi-dev \
    -d libgdbm-dev \
    -d libncurses5-dev \
    -d libreadline-dev \
    -d libssl-dev \
    -d libyaml-dev \
    -d zlib1g-dev \
    -C /tmp/fpm \
    -p /ruby-2.1.34_37s~precise_amd64.deb \
    opt
`, 18)

	assert.Equal(t, dockerFileFromTemplate("ubuntu:12.04", "2.1.34", "amd64", "37s~precise", 18).String(), dockerfile_putput)
}

// Could do with pushing this out to go-bindata or similar
func Test_dockerFileFromTemplate_lucid(t *testing.T) {
	dockerfile_putput := fmt.Sprintf(`FROM ubuntu:10.04
RUN echo "deb http://security.ubuntu.com/ubuntu lucid-security main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y ruby1.9.1-full build-essential \
    libc6-dev libffi-dev libgdbm-dev libncurses5-dev \
    libreadline-dev libssl-dev libyaml-dev zlib1g-dev \
    libopenssl-ruby1.9.1 ruby1.9.1-dev curl
RUN curl http://production.cf.rubygems.org/rubygems/rubygems-2.4.2.tgz |tar oxzC /tmp
RUN cd /tmp/rubygems-2.4.2 && ruby1.9.1 setup.rb
RUN gem1.9.1 install fpm --bindir=/usr/bin --no-rdoc --no-ri
RUN curl http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.34.tar.gz|tar oxzC /tmp
WORKDIR /tmp/ruby-2.1.34
RUN CFLAGS='-march=x86-64 -O3 -fno-fast-math -g3 -ggdb -Wall -Wextra -Wno-unused-parameter -Wno-parentheses -Wno-long-long -Wno-missing-field-initializers -Wunused-variable -Wpointer-arith -Wwrite-strings -Wdeclaration-after-statement -Wimplicit-function-declaration -Wdeprecated-declarations -Wno-packed-bitfield-compat -std=iso9899:1999  -fPIC' ./configure \
  --prefix=/opt/ruby2.1.34 \
  --enable-shared \
  --disable-install-doc \
  --enable-load-relative
# Seems to only affect some 1.9 series Rubies, but the combined make step:
#
#     RUN make -j8 install DESTDIR=/tmp/fpm
#
# that rane the make then make install, was broken. Splitting it up into
# two separate commands works fine:
RUN make -j%d
RUN make install DESTDIR=/tmp/fpm

WORKDIR /
RUN fpm \
    -s dir \
    -t deb \
    -n ruby-2.1.34 \
    -a amd64 \
    -v 2.1.34 \
    --iteration 37s~lucid \
    -d libc6-dev \
    -d libffi-dev \
    -d libgdbm-dev \
    -d libncurses5-dev \
    -d libreadline-dev \
    -d libssl-dev \
    -d libyaml-dev \
    -d zlib1g-dev \
    -C /tmp/fpm \
    -p /ruby-2.1.34_37s~lucid_amd64.deb \
    opt
`, 23)

	assert.Equal(t, dockerFileFromTemplate("ubuntu:10.04", "2.1.34", "amd64", "37s~lucid", 23).String(), dockerfile_putput)
}

func Test_rubyPackageFileName(t *testing.T) {
	assert.Equal(t, "ruby-2.1.0_37s~raring_amd64.deb", rubyPackageFileName("2.1.0", "37s~raring", "amd64", "ubuntu:12.04"))
}

func Test_createTarFileFromDockerfile(t *testing.T) {
	patch_files := []string{"Dockerfile", "data/patches/1.0.0/01_for_tests", "data/patches/1.0.0/02_for_tests"}
	file_data := []string{"foo", "bar", "baz"}

	tar_in_buffer := createTarFileFromDockerfile(bytes.NewBufferString("foo"), patch_files[1:3])

	var tar_out *tar.Reader = tar.NewReader(tar_in_buffer)

	for i, filename := range patch_files {
		// Get the header so we can check the names of the files
		tar_header, err := tar_out.Next()
		if err != nil {
			panic(err)
		}

		var out_bytes []byte
		out_bytes, err = ioutil.ReadAll(tar_out)
		if err != nil {
			panic(err)
		}

		assert.Equal(t, tar_header.Name, filepath.Base(filename))
		assert.Equal(t, string(out_bytes), file_data[i])
	}
}

func Test_patchFilePathsFromRubyVersion(t *testing.T) {
	patches := patchFilePathsFromRubyVersion("1.0.0")
	expected_patches := []string{"data/patches/1.0.0/01_for_tests", "data/patches/1.0.0/02_for_tests"}
	assert.Equal(t, patches, expected_patches)
}

func Test_copyPackageFromContainerToLocalFs(t *testing.T) {
	t.Skip()
}

func Test_buildRuby(t *testing.T) {
	t.Skip()
}
