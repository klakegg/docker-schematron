#!/bin/sh

# Install zip
apk --no-cache add zip gettext

# Prepare command
chmod a+x /docker/bin/*
mv /docker/bin/* /bin/

# Delete content
rm -r /docker
