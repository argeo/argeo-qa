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

# Deploy
rm -rf $WWW_DIR/*
mkdir -p $WWW_DIR/$ARGEO_DOC
rsync -av --exclude ".*" --exclude "*.sh" --exclude "argeo.css" --exclude "www" $DIR/ $WWW_DIR/$ARGEO_DOC
rsync -av $DIR/theme/argeo.css $WWW_DIR/$ARGEO_DOC

rsync -av --exclude ".*" --exclude "*.sh" --exclude "argeo.css" $DIR/www/ $WWW_DIR
rsync -av $DIR/theme/argeo.css $WWW_DIR
