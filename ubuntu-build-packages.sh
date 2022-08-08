#!/bin/bash

if [ "x$GOPATH" == "x" ] ; then
    . ./SETUP.bash
fi

if [ ! -d $GOPATH/deps ] ; then
    mkdir $GOPATH/deps
fi
cd $GOPATH/deps

if [ ! -f vips-8.7.0.tar.gz ] ; then
    curl -L -X GET https://github.com/libvips/libvips/releases/download/v8.7.0/vips-8.7.0.tar.gz > vips-8.7.0.tar.gz
fi

if [ ! -d vips-8.7.0 ] ; then
    tar -zxf vips-8.7.0.tar.gz
fi

cd vips-8.7.0/

# The following was in the original install script for Ubuntu,
# but doesn't appear to be a Debian 10 package
#
# libjpeg-turbo8-dev
    
sudo apt-get install \
     pkg-config \
     libc6-dev \
     libtiff-dev libjpeg-dev libpng-dev libgif-dev \
     librsvg2-dev  \
     libtiff5-dev \
     libexif-dev \
     libexpat-dev libexpat1-dev \
     libfftw3-dev \
     liborc-0.4-dev \
     libglib2.0-dev libgsf-1-dev glib2.0-dev

sudo apt-get install cmake autoconf unzip xz-utils 
sudo apt-get install libglib2.0-dev 
#sudo apt-get install gmodule-2.0 gobject-2.0

sudo apt-get install libexpat-dev gtk-doc-tools

# libtool  python3-pip python-setuptools
 
sudo ./configure

sudo make -j 6

sudo make install

cd $GOPATH/deps

if [ ! -f LibRaw-0.19.0.tar.gz ] ; then
    curl -X GET https://www.libraw.org/data/LibRaw-0.19.0.tar.gz > LibRaw-0.19.0.tar.gz
fi

if [ ! -d LibRaw-0.19.0 ] ; then
    tar -zxf LibRaw-0.19.0.tar.gz
fi

cd LibRaw-0.19.0/

sudo ./configure

sudo make -j 6

sudo make install

