#!/bin/bash

echo ""
echo "Away to check out and build filestash, including supporting packages."
echo "See BUILDING.md for further details"
read -p "Press <enter> to continue:"
echo ""


if [ ! -d go-all ] ; then
    echo "Creating directory:"
    echo "    go-all"
    mkdir go-all
    
#    echo "export GOPATH=$PWD/go-all" >> ~/.profile
#    echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.profile
#    echo 'export CGO_LDFLAGS_ALLOW='-fopenmp'' >> ~/.profile
#    echo 'echo "Set GOPATH=$GOPATH"' >> ~/.profile
#    echo 'echo "Updated PATH to include /usr/local/go/bin"' >> ~/.profile
fi

if ["x$GOPATH" == "x" ] ; then
    . ./SETUP.bash
fi

if [ ! -d $GOPATH ] ; then
    echo "Making directory: $GOPATH"
    mkdir $GOPATH
fi

./ubuntu-build-packages.sh

./ubuntu-build-filestash.sh


./ubuntu-build-postinstall.sh
