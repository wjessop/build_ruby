package main

import (
	"crypto/tls"
	"crypto/x509"
	"io/ioutil"
	"net/http"
	"path/filepath"
)

/*
	We need to create our own TLS connection for the new boot2docker
	version, see https://github.com/fsouza/go-dockerclient/issues/166
	for details, this code based on stuff found there.
*/

func NewHTTPSClient(cert string) (*http.Client, error) {
	cas := x509.NewCertPool()
	pemData, err := ioutil.ReadFile(filepath.Join(cert, "ca.pem"))
	if err != nil {
		return nil, err
	}

	//add to pool and configrue tls
	cas.AppendCertsFromPEM(pemData)

	//load pair
	pair, err := tls.LoadX509KeyPair(filepath.Join(cert, "cert.pem"), filepath.Join(cert, "key.pem"))
	if err != nil {
		return nil, err
	}

	//create new tls config with the created ca and pair
	conf := &tls.Config{
		RootCAs:      cas,
		Certificates: []tls.Certificate{pair},
	}

	//create our own transport
	tr := &http.Transport{
		TLSClientConfig: conf,
	}

	return &http.Client{Transport: tr}, nil
}
