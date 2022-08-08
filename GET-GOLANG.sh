#!/bin/bash

. ./.golang-package-version


if [ ! -f go$golang_package_version.linux-amd64.tar.gz ] ; then
    curl -O https://dl.google.com/go/go$golang_package_version.linux-amd64.tar.gz
else
    echo "Skipping download, as Go tarball already exists!"
fi


if [ ! -d go$golang_package_version.linux-amd64 ] ; then
   
   tar xvzf go$golang_package_version.linux-amd64.tar.gz

   echo "Renaming go/ to go$golang_package_version.linux-amd64/"
   mv go go$golang_package_version.linux-amd64
else
    echo "Go directory already exists: go$golang_package_version.linux-amd64"
    echo "Skipping untar step"
fi
   

