#!/bin/sh

# Install zip
apk --no-cache add zip gettext

# Prepare command
mv /docker/schematron /bin/schematron
chmod a+x /bin/schematron

# Delete content
rm -r /docker