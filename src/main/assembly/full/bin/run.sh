#!/bin/sh

APP=$(dirname $(readlink -f $0))/..

java -classpath $APP:$APP/lib/* net.klakegg.docker.schematron.Main $@