#!/bin/sh
set -e

DIR="$( cd "$( dirname "$0" )" && pwd )"
WWW_DIR=/srv/www
ARGEO_DOC=argeo-2.1/doc

# Update
git -C $DIR pull

# Generate
$DIR/platform/generate-html.sh
$DIR/www/generate-html.sh

# Clean up
rm -f $WWW_DIR/*.html
rm -f $WWW_DIR/*.xml
rm -f $WWW_DIR/*.css
rm -rf $WWW_DIR/$ARGEO_DOC/platform

# Deploy platform doc
mkdir -p $WWW_DIR/$ARGEO_DOC
rsync -av --exclude '.*' --exclude '*.sh' --exclude 'argeo.css' $DIR/platform/ $WWW_DIR/$ARGEO_DOC/platform
rsync -av $DIR/theme/argeo.css $WWW_DIR/$ARGEO_DOC/platform

# Deploy www
rsync -av --exclude '.*' --exclude '*.sh' --exclude 'argeo.css' $DIR/www/ $WWW_DIR
rsync -av $DIR/theme/argeo.css $WWW_DIR

# Deploy gitweb CSS
cp $DIR/gitweb/argeo-gitweb.css /var/www/git/argeo-gitweb.css