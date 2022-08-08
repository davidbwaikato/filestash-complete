#!/bin/bash

if [ "x$GOPATH" == "x" ] ; then
    . ./SETUP.bash
fi

# The following primarily installs 'tinytex' as a light-weight way
# to run pdflatex
# Based on the (post)-install scripting commands in Dockerfile
pushd $GOPATH/src/github.com/mickael-kerjean/filestash/docker
sudo ./filestash-postinstall.sh
popd


#sudo apt-get install emacs texlive texlive-base texlive-latex-extra zip

#sudo chmod 777 /usr/share/texlive/texmf-dist/tex/latex/base/

#sudo curl https://raw.githubusercontent.com/mickael-kerjean/filestash_latex/master/wrapfig.sty > /usr/share/texlive/texmf-dist/tex/latex/base/wrapfig.sty

#sudo curl https://raw.githubusercontent.com/mickael-kerjean/filestash_latex/master/capt-of.sty > /usr/share/texlive/texmf-dist/tex/latex/base/capt-of.sty

#sudo curl https://raw.githubusercontent.com/mickael-kerjean/filestash_latex/master/sectsty.sty > /usr/share/texlive/texmf-dist/tex/latex/base/sectsty.sty

#sudo texhash

#sudo find /usr/share/emacs -name '*.pbm' | sudo xargs rm

#sudo find /usr/share/emacs -name '*.png' | sudo xargs rm

#sudo find /usr/share/emacs -name '*.xpm' | sudo xargs rm

#sudo rm -rf /usr/share/texmf-dist/doc


#cd $GOPATH/src/github.com/mickael-kerjean/filestash/



echo ""
echo "****"
echo "* To install freshly build filestash:"
echo "*"
echo "*   [Remove existing /app directory, then ...]"
echo "*   sudo mv $GOPATH/src/github.com/mickael-kerjean/filestash/dist /app"
echo "****"
echo ""

echo "Consider opening up port 8334, with:"
echo "  sudo ufw allow 8334"
echo ""



