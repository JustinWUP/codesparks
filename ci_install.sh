###BEGIN SCRIPT###

###SCRIPT NAME:  ci_install.sh ###

#!/bin/bash

argument1=$1  ###This is your incoming argument.
argument2=$2
argument3=$(whoami)
escapestring=(echo '$1')

mkdir ~/Sites/$argument1 ###This is your command using the argument.
git clone https://github.com/JustinWUP/citemplate.git  ~/Sites/$argument1 

sudo -- sh -c "echo  >> /etc/hosts"
sudo -- sh -c "echo 127.0.0.1 $argument2.spark >> /etc/hosts"
sudo -- sh -c "echo 127.0.0.1 www.$argument2.spark >> /etc/hosts"

sudo -- sh -c "echo  >> ~/Sites/.htaccess"
sudo -- sh -c "echo \#for site $argument2\.spark >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteEngine On  >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteCond %{HTTP_HOST} ^\(www\\\.\)?$argument2\\\.spark$ [NC] >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteCond %{REQUEST_URI} !^/~$argument3/$argument1 >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteRule ^\(.*\)$ /~$argument3/$argument1/\$\1 [L] >> ~/Sites/.htaccess"


sudo -- sh -c "echo  >> ~/Sites/$argument1/.htaccess"
sudo -- sh -c "echo \<IfModule mod_rewrite.c\> >> ~/Sites/$argument1/.htaccess"
sudo -- sh -c "echo     Options +FollowSymLinks >> ~/Sites/$argument1/.htaccess"
sudo -- sh -c "echo     RewriteEngine On >> ~/Sites/$argument1/.htaccess"
sudo -- sh -c "echo     RewriteBase /$argument3/$argument1/ >> ~/Sites/$argument1/.htaccess"
sudo -- sh -c "echo     RewriteCond %{REQUEST_FILENAME} !-f >> ~/Sites/$argument1/.htaccess"
sudo -- sh -c "echo     RewriteCond %{REQUEST_FILENAME} !-d >> ~/Sites/$argument1/.htaccess"
sudo -- sh -c "echo     RewriteRule ^/\(.*\)$ /index.php/$1 [L] >> ~/Sites/$argument1/.htaccess"
sudo -- sh -c "echo \</IfModule\>  >> ~/Sites/$argument1/.htaccess"
rm ~/Sites/$argument1/ci_install.sh

#escape these arrow brackets

sudo -- sh -c "echo  >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo     \<VirtualHost *:80\> >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo ServerName $argument2.spark >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo         DocumentRoot /Users/$argument3/Sites/$argument1 >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo         \<Directory /Users/$argument3/Sites/$argument1\> >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo             AllowOverride All >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo             Options +FollowSymLinks >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo             Order allow,deny >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo             Allow from All >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo 		\</Directory\> >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo     \</VirtualHost\> >> /private/etc/apache2/extra/httpd-vhosts.conf"

sudo apachectl restart

open http://$argument2.spark

###END SCRIPT###