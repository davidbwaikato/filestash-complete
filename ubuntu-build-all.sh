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

./ubuntu-build-fileshash.sh

sudo apt-get install emacs texlive texlive-base texlive-latex-extra zip

sudo chmod 777 /usr/share/texlive/texmf-dist/tex/latex/base/

sudo curl https://raw.githubusercontent.com/mickael-kerjean/filestash_latex/master/wrapfig.sty > /usr/share/texlive/texmf-dist/tex/latex/base/wrapfig.sty

sudo curl https://raw.githubusercontent.com/mickael-kerjean/filestash_latex/master/capt-of.sty > /usr/share/texlive/texmf-dist/tex/latex/base/capt-of.sty

sudo curl https://raw.githubusercontent.com/mickael-kerjean/filestash_latex/master/sectsty.sty > /usr/share/texlive/texmf-dist/tex/latex/base/sectsty.sty

sudo texhash

sudo find /usr/share/emacs -name '*.pbm' | sudo xargs rm

sudo find /usr/share/emacs -name '*.png' | sudo xargs rm

sudo find /usr/share/emacs -name '*.xpm' | sudo xargs rm

sudo rm -rf /usr/share/texmf-dist/doc

cd $GOPATH/src/github.com/mickael-kerjean/filestash/

sudo apt-get install ca-certificates

sudo mv dist /app

cd /app

echo "Opening up port: 8334"
sudo ufw allow 8334

echo "Running filestash server"
./filestash
