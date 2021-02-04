#!/bin/sh

# default is CentOS 8
if [ -z "$XSL" ]; then
	# CentOS
	XSL=/usr/share/sgml/docbook/xsl-stylesheets/fo/docbook.xsl
	# Debian
	XSL=/usr/share/xml/docbook/stylesheet/docbook-xsl-ns/fo/docbook.xsl
fi

DIR="$( cd "$( dirname "$0" )" && pwd )"

xsltproc --xinclude \
	--stringparam html.stylesheet argeo.css \
	--stringparam navig.graphics 1 \
    --stringparam navig.graphics.extension .png \
	--output $DIR/argeo-platform.fo \
	$XSL \
	$DIR/argeo-platform.dbk.xml
fop $DIR/argeo-platform.fo $DIR/argeo-platform.pdf
