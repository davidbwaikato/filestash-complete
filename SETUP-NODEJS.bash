

. ./.nodejs-package-version

export PATH=$PWD/node-$nodejs_package_version-linux-x64/bin:$PATH
echo "Updated PATH to include node, npm and npx"

export NODE_PATH=$PWD/node-$nodejs_package_version-linux-x64/lib/node_modules
echo "Set NODE_PATH to include node-$nodejs_package_version/lib/node_modules"
