#!/bin/sh

set -e

openssl genrsa -f4 -out debug.key 2048
openssl req -batch -new -x509 -key debug.key -out debug.crt
