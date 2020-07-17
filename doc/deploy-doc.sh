#!/bin/sh

BASE_DIR="$( cd "$( dirname "$0" )" && pwd )"
WWW_DIR=/srv/www

# Update
git -C $BASE_DIR pull

# Generate
./platform/generate-html.sh
./www/generate-html.sh

# Deploy
mkdir -p $WWW_DIR/argeo-2.1/doc
rsync -av --exclude ".*" --exclude "*.sh" --exclude "argeo.css" --exclude "www" $BASE_DIR/ $WWW_DIR/argeo-2.1/doc
rsync -av $BASE_DIR/theme/argeo.css $WWW_DIR/argeo-2.1/doc

rsync -av --exclude ".*" --exclude "*.sh" --exclude "argeo.css" $BASE_DIR/www/ $WWW_DIR
rsync -av $BASE_DIR/theme/argeo.css $WWW_DIR
