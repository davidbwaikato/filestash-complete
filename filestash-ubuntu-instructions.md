# Concerning versions of installed languages

At the time of writing (4 Aug 202) it was found that newer versions of
NodeJS (the default version on Unbuntu at the time was v16) caused a
React dependency issue when 'npm install' was run, causing
installation to fail.

The chosen workaround was to look up the version of NodeJS being run
in the Docker container provided to run filestash, and match to that.

    ./GET-NODEJS.sh


Next it was found that the version of 'go' needed to be fairly up to
date, to make use of the 'embed' feature of the language.  Version
1.16.2 was chosen.  This is one minor version up from when 'embed' was
introduced into the language.

    ./GET-GOLANG.sh


## Installation Instructions

    . ./SETUP.bash
       

First install go like so (to the /usr/local directory):

    sudo apt-get install build-essential pkg-config curl gcc g++ make git

    # Install "PEM files of CA certificates to allow SSL-based applications to check 
    # for the authenticity of SSL connections"    
    sudo apt-get install ca-certificates

    # The following are utils are used on a running filestash server (from Dockerfile)
    sudo apt-get install tor emacs-nox ffmpeg zip poppler-utils

    # The following utils are used to install tinytex on Docker server image (from Dockerfile)
    # => so needed here on host 
    sudo apt-get wget perl
 
Then run the sh script (ubuntu-build-all.sh) to install filestash. The
executable will be located at /app and the source code at
$GOPATH/src/github.com/mickael-kerjean/filestash/

You will be promted via sudo for your password

To run the executable:

    cd /app && ./filestash


*NOTE: PORT 8334 IS NEEDED TO RUN, WHICH THE SCRIPT MAKES UFW ALLOW. IF YOU CHANGE THE PORT IN THE SOURCECODE, YOU WILL NEED TO ALLOW THAT PORT IN UFW. IF YOU USE SOMETHING OTHER THAN UFW, EDIT THE SH SCRIPT TO ALLOW PORT 8334 WITH YOUR FIREWALL*

If you edit the source code and want to rebuild the executable, do this:

    cd $GOPATH/src/github.com/mickael-kerjean/filestash/

    mkdir -p ./dist/data/

    cp -r config ./dist/data/

    NODE_ENV=production npm run build

    go build -ldflags "-X github.com/mickael-kerjean/filestash/server/common.BUILD_NUMBER=`date -u +%Y%m%d`" -o ./dist/filestash ./server/main.go

    mkdir -p ./dist/data/plugin

    go build -buildmode=plugin -o ./dist/data/plugin/image.so server/plugin/plg_image_light/index.go

    sudo mv dist/* /app

Then to execute it:

    cd /app && ./filestash