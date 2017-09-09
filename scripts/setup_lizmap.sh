#!/bin/bash

set -x

# unzip lizmap master
unzip /var/www/$LIZMAPVERSION.zip -d /var/www/
mv /var/www/lizmap-web-client-$LIZMAPVERSION/ /var/www/websig/
rm /var/www/$LIZMAPVERSION.zip
# Set rights & active config
chmod +x /var/www/websig/lizmap/install/set_rights.sh
/var/www/websig/lizmap/install/set_rights.sh www-data www-data
cp /var/www/websig/lizmap/var/config/lizmapConfig.ini.php.dist /var/www/websig/lizmap/var/config/lizmapConfig.ini.php
cp /var/www/websig/lizmap/var/config/localconfig.ini.php.dist /var/www/websig/lizmap/var/config/localconfig.ini.php
cp /var/www/websig/lizmap/var/config/profiles.ini.php.dist /var/www/websig/lizmap/var/config/profiles.ini.php
#  Installer
php /var/www/websig/lizmap/install/installer.php
# Set rights
chown :www-data  /var/www/websig/lizmap/www -R
chmod 775  /var/www/websig/lizmap/www -R
chown :www-data /var/www/websig/lizmap/var -R
chmod 775  /var/www/websig/lizmap/var -R
cp -avr /var/www/websig/lizmap/var var/www/websig/lizmap/var_install
