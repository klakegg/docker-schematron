#!/bin/sh

cd $(dirname $(readlink -f $0))/..

java -classpath .:lib/* net.klakegg.docker.schematron.Main $@