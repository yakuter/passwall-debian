GIT=$(which git)
NPM=$(which npm)
GO=$(which go)
TMP_DIR=/tmp/passwall-build
SERVER_PATH=$TMP_DIR/passwall-server
DESKTOP_PATH=$TMP_DIR/passwall-desktop
WEB_PATH=$TMP_DIR/passwall-web
DEBIAN_PATH=$TMP_DIR/passwall-debian
PASSWALL_OPT_PATH=$DEBIAN_PATH/usr/share/passwall
SERVER_BIN_PATH=$DEBIAN_PATH/usr/bin/passwall/server
WEB_BIN_PATH=$PASSWALL_OPT_PATH/public

rm -rf $TMP_DIR

mkdir $TMP_DIR
mkdir $DEBIAN_PATH
mkdir -p $PASSWALL_OPT_PATH
mkdir -p $SERVER_BIN_PATH
mkdir -p $WEB_BIN_PATH

mkdir -p $DEBIAN_PATH/DEBIAN
cp -r ./debian/control $DEBIAN_PATH/DEBIAN/control
echo "Version: 000.$1" >> $DEBIAN_PATH/DEBIAN/control
cp -r ./debian/postinst $DEBIAN_PATH/DEBIAN/postinst

$GIT clone https://github.com/pass-wall/passwall-server $SERVER_PATH
$GIT clone https://github.com/pass-wall/passwall-web $WEB_PATH

echo "Building passwall-server..."
cd $SERVER_PATH && CGO_ENABLED=1 GOOS=linux $GO build -a --ldflags="-s" -o passwall-server
cp $SERVER_PATH/passwall-server $SERVER_BIN_PATH/passwall-server
cp -r $SERVER_PATH/store $PASSWALL_OPT_PATH/store
echo "Building passwall-server completed successfully."

echo "Building passwall-web..."
sed -i "s/next build/next build \&\& next export/g" $WEB_PATH/package.json
cd $WEB_PATH && $NPM install && $NPM run build
cp -r $WEB_PATH/out/* $WEB_BIN_PATH/
echo "Building passwall-web completed successfully."

echo "Building deb package..."
dpkg-deb --build $DEBIAN_PATH
echo "Building deb package completed successfully."

echo "You can install this deb package by running: sudo apt install $DEBIAN_PATH.deb"
