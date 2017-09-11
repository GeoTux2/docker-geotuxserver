#!/bin/bash
echo "Starting GeoTux GIS Server container"
echo "---------------------------------"

# Test tileserver.php
file="/var/www/tileserver-php/tileserver.php"
if [ -f "$file" ]
then
  echo "$file found in the volume."
else
  echo "Copying tileserver.php into volume..."
  cp /srv/tileserver-php/* /srv/tileserver-php/.* /var/www/tileserver-php/
fi

# Test mapcache.xml
mapcache="/mapcache/mapcache.xml"
if [ -f "$mapcache" ]
then
  echo "$mapcache found in the volume."
else
  echo "Copying mapcache.xml into volume..."
  cp /srv/mapcache.xml /mapcache/mapcache.xml
fi

# Test projects QGIS
qgis="/gisdata/projects/demo/helloworld.qgs"
if [ -f "$qgis" ]
then
  echo "$qgis projects found in the volume."
else
  echo "Copying qgis projects into volume..."
  cp -rf /srv/qgis-web-client/projects /gisdata/projects/demo
  cp -rf /srv/qgis-web-client/data /gisdata/projects/data
fi

# Apache server init
if [ ! -d "$APACHE_RUN_DIR" ]; then
	mkdir "$APACHE_RUN_DIR"
	chown $APACHE_RUN_USER:$APACHE_RUN_GROUP "$APACHE_RUN_DIR"
fi
if [ -f "$APACHE_PID_FILE" ]; then
	rm "$APACHE_PID_FILE"
fi
/usr/sbin/apache2ctl -D FOREGROUND
