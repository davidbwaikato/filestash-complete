
echo ""
. ./SETUP-NODEJS.bash
. ./SETUP-GOLANG.bash


export GOPATH=$PWD/go-all
export PATH=$GOPATH/bin:$PATH

export CGO_LDFLAGS_ALLOW=-fopenmp

echo ""
echo "Set GOPATH=$GOPATH"
echo "Updated PATH to include \$GOPATH/bin"
echo "Set environment variable CGO_LDFLAGS_ALLOW=$CGO_LDFLAGS_ALLOW"
echo ""

