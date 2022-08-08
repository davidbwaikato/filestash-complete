#!/bin/bash

. ./.nodejs-package-version

if [ ! -f node-$nodejs_package_version-linux-x64.tar.gz ] ; then
    curl -O https://nodejs.org/dist/$nodejs_package_version/node-$nodejs_package_version-linux-x64.tar.gz
else
    "Skipping download, as NodeJS tarball already exists!"
fi


tar xvzf node-$nodejs_package_version-linux-x64.tar.gz

