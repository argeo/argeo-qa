#!/bin/sh

# default is CentOS 8
if [ -z "$XSL" ]; then
	XSL=/usr/share/sgml/docbook/xsl-stylesheets/xhtml/chunk.xsl
fi

DIR=`dirname $0`

xsltproc --xinclude \
	--stringparam html.stylesheet $DIR/argeo.css \
	--stringparam navig.graphics 1 \
    --stringparam navig.graphics.extension .png \
	--output $DIR/argeo-platform.html \
	$XSL \
	$DIR/argeo-platform.dbk.xml
