#!/bin/sh

# default is CentOS 8
if [ -z "$XSL" ]; then
	XSL=/usr/share/sgml/docbook/xsl-stylesheets/xhtml/docbook.xsl
fi

DIR="$( cd "$( dirname "$0" )" && pwd )"

xsltproc --xinclude \
	--stringparam html.stylesheet argeo.css \
	--stringparam generate.toc "qandaset toc" \
	--output $DIR/index.html \
	$XSL \
	$DIR/argeo-www.dbk.xml
