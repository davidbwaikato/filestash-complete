#!/bin/bash

. ./.golang-package-version


if [ ! -f go$golang_package_version.linux-amd64.tar.gz ] ; then
    curl -O https://dl.google.com/go/go$golang_package_version.linux-amd64.tar.gz
else
    "Skipping download, as Go tarball already exists!"
fi


tar xvzf go$golang_package_version.linux-amd64.tar.gz

