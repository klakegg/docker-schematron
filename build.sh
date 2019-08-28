#!/bin/sh

docker build -f Dockerfile -t schematron:base .
docker build -f Dockerfile-iso -t schematron:iso .
docker build -f Dockerfile-schxslt -t schematron:schxslt .
