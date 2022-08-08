#!/bin/bash

if [ "x$GOPATH" == "x" ] ; then
    . ./SETUP.bash    
fi


mkdir -p $GOPATH/src/github.com/mickael-kerjean/

cd $GOPATH/src/github.com/mickael-kerjean

if [ ! -d filestash ] ; then
    git clone --depth 1 https://github.com/davidbwaikato/filestash
fi

cd filestash

cd server/plugin/plg_image_light/deps

GLIB_CFLAGS=`pkg-config --cflags glib-2.0`
#GLIB_LDFLAGS=`pkg-config --libs glib-2.0`

echo "Creating libtranscode.a"
gcc -Wall $GLIB_CFLAGS -c src/libtranscode.c
/bin/rm -f libtranscode.a
ar rcs libtranscode.a libtranscode.o 

echo "Creating libtresize.a"
gcc -Wall $GLIB_CFLAGS -c src/libresize.c
/bin/rm -f libresize.a
ar rcs libresize.a libresize.o 

cd ../../../..

echo "Pausing for 5 seconds ... ^C is above failed"
sleep 5

# CWD = top-level filestash git-clone source code
pwd

mkdir -p ./dist/data/

cp -r config ./dist/data/

npm install

npm rebuild node-sass

# NODE_ENV=production npm run build
make build_frontend

echo "Pausing for 5 seconds ... ^C is above failed"
sleep 5

cd $GOPATH/src/github.com/mickael-kerjean/filestash/server

go get

cd ..

# go generate -x ./server/...
make build_init


# go build -ldflags "-X github.com/mickael-kerjean/filestash/server/common.BUILD_NUMBER=`date -u +%Y%m%d`" -o ./dist/filestash ./server/main.go
make build_backend

#mkdir -p ./dist/data/plugin

#echo "***"
#echo "*** Supressing plg_image_light"
#echo "***"

# go build -buildmode=plugin -o ./dist/data/plugin/image.so server/plugin/plg_image_light/index.go

