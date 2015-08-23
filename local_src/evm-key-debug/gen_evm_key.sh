#!/bin/sh

set -e

#openssl genrsa -f4 -out debug.key 2048
#openssl req -batch -new -x509 -key debug.key -out debug.crt
#openssl x509 -outform DER -out debug.der -in debug.crt 

openssl req -new -nodes -utf8 -sha1 -days 36500 -batch \
            -x509 -config gen_evm_key.conf \
            -outform DER -out debug.der -keyout privkey_debug.pem
openssl rsa -pubout -in privkey_debug.pem -out pubkey_debug.pem

