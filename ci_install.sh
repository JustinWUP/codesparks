###BEGIN SCRIPT###

###SCRIPT NAME:  ci_install.sh ###

#!/bin/bash

read "ARGUMENT1?What should your folder be called?"
read "ARGUMENT2?What should your domain be called?"

argument3=$(whoami)
escapestring=(echo '$1')

mkdir ~/Sites/$ARGUMENT1 ###This is your command using the argument.
git clone https://github.com/JustinWUP/citemplate.git  ~/Sites/$ARGUMENT1 

sudo -- sh -c "echo  >> /etc/hosts"
sudo -- sh -c "echo 127.0.0.1 $ARGUMENT2.spark >> /etc/hosts"
sudo -- sh -c "echo 127.0.0.1 www.$ARGUMENT2.spark >> /etc/hosts"

sudo -- sh -c "echo  >> ~/Sites/.htaccess"
sudo -- sh -c "echo \#for site $ARGUMENT2\.spark >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteEngine On  >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteCond %{HTTP_HOST} ^\(www\\\.\)?$ARGUMENT2\\\.spark$ [NC] >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteCond %{REQUEST_URI} !^/~$argument3/$ARGUMENT1 >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteRule ^\(.*\)$ /~$argument3/$ARGUMENT1/\$\1 [L] >> ~/Sites/.htaccess"


sudo -- sh -c "echo  >> ~/Sites/$ARGUMENT1/.htaccess"
sudo -- sh -c "echo \<IfModule mod_rewrite.c\> >> ~/Sites/$ARGUMENT1/.htaccess"
sudo -- sh -c "echo     Options +FollowSymLinks >> ~/Sites/$ARGUMENT1/.htaccess"
sudo -- sh -c "echo     RewriteEngine On >> ~/Sites/$ARGUMENT1/.htaccess"
sudo -- sh -c "echo     RewriteBase /$argument3/$ARGUMENT1/ >> ~/Sites/$ARGUMENT1/.htaccess"
sudo -- sh -c "echo     RewriteCond %{REQUEST_FILENAME} !-f >> ~/Sites/$ARGUMENT1/.htaccess"
sudo -- sh -c "echo     RewriteCond %{REQUEST_FILENAME} !-d >> ~/Sites/$ARGUMENT1/.htaccess"
sudo -- sh -c "echo     RewriteRule ^/\(.*\)$ /index.php/$1 [L] >> ~/Sites/$ARGUMENT1/.htaccess"
sudo -- sh -c "echo \</IfModule\>  >> ~/Sites/$ARGUMENT1/.htaccess"
rm ~/Sites/$ARGUMENT1/ci_install.sh

#escape these arrow brackets

sudo -- sh -c "echo  >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo     \<VirtualHost *:80\> >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo ServerName $ARGUMENT2.spark >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo         DocumentRoot /Users/$argument3/Sites/$ARGUMENT1 >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo         \<Directory /Users/$argument3/Sites/$ARGUMENT1\> >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo             AllowOverride All >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo             Options +FollowSymLinks >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo             Order allow,deny >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo             Allow from All >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo 		\</Directory\> >> /private/etc/apache2/extra/httpd-vhosts.conf"
sudo -- sh -c "echo     \</VirtualHost\> >> /private/etc/apache2/extra/httpd-vhosts.conf"

sudo apachectl restart

open http://$ARGUMENT2.spark

###END SCRIPT###