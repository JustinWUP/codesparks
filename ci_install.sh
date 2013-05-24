###BEGIN SCRIPT###

###SCRIPT NAME:  ci_install.sh ###

#!/bin/bash


argument1=$1  ###This is your incoming argument.
argument2=$2
argument3=$(whoami)
slots=$3
escapestring=(echo '$1')

echo 'Getting Sparks...'
mkdir ~/Sites/$argument1 ###This is your command using the argument.
git clone https://github.com/JustinWUP/citemplate.git  ~/Sites/$argument1 

echo 'Modifying your hosts file for our project...'
sudo -- sh -c "echo  >> /etc/hosts"
sudo -- sh -c "echo 127.0.0.1 $argument2.spark >> /etc/hosts"
sudo -- sh -c "echo 127.0.0.1 www.$argument2.spark >> /etc/hosts"

echo 'Modifying your Apache root .htaccess...'
sudo -- sh -c "echo  >> ~/Sites/.htaccess"
sudo -- sh -c "echo \#for site $argument2\.spark >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteEngine On  >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteCond %{HTTP_HOST} ^\(www\\\.\)?$argument2\\\.spark$ [NC] >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteCond %{REQUEST_URI} !^/~$argument3/$argument1 >> ~/Sites/.htaccess"
sudo -- sh -c "echo RewriteRule ^\(.*\)$ /~$argument3/$argument1/\$\1 [L] >> ~/Sites/.htaccess"

echo 'Creating an .htaccess file for your project...'
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
echo 'Setting up a VirtualHost...'
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

echo 'Restarting Apache...'
sudo apachectl restart

case "${slots[@]}" in  *"compass"*)
	echo 'Installing Compass...'  
	gem install compass 
	echo 'Setting up your project for Compass...'
	mkdir ~/Sites/$argument1/assets/sass 
	sudo -- sh -c "echo http_path = \'/\' >> ~/Sites/$argument1/config.rb"
	sudo -- sh -c "echo sass_dir = \'assets/sass\'  >> ~/Sites/$argument1/config.rb"                   
 	sudo -- sh -c "echo css_dir = \'assets/css\' >> ~/Sites/$argument1/config.rb"
 	sudo -- sh -c "echo images_dir = \'assets/images\' >> ~/Sites/$argument1/config.rb"
 	sudo -- sh -c "echo javascripts_dir = \'assets/js\' >> ~/Sites/$argument1/config.rb"
  	sudo -- sh -c "echo http_stylesheets_path = \'assets/css\' >> ~/Sites/$argument1/config.rb"
  	sudo -- sh -c "echo http_javascripts_path = \'assets/js\' >> ~/Sites/$argument1/config.rb"
  	sudo -- sh -c "echo http_images_path = \'assets/images\' >> ~/Sites/$argument1/config.rb"
  	sudo -- sh -c "echo environment = :development >> ~/Sites/$argument1/config.rb"
  	sudo -- sh -c "echo output_style = :expanded >> ~/Sites/$argument1/config.rb"
  	sudo -- sh -c "echo relative_assets = true >> ~/Sites/$argument1/config.rb" ;; esac

echo " (                                                           "
echo " )\ )                      )          )        (             "
echo "(()/(           )  (    ( /(   (   ( /(      ( )\  (         "
echo " /(_))\`  )   ( /(  )(   )\())  )\  )\())     )((_) )(    (   "
echo "(_))  /(/(   )(_))(()\ ((_)\  ((_)(_))/     ((_)_ (()\   )\  "
echo "/ __|((_)_\ ((_)_  ((_)| |(_)  (_)| |_   )   | _ ) ((_) ((_) "
echo "\__ \| '_ \)/ _\` || '_|| / /   | ||  _| /(   | _ \| '_|/ _ \ "
echo "|___/| .__/ \__,_||_|  |_\_\   |_| \__|(_))  |___/|_|  \___/ "
echo "     |_|                                                     "

open http://$argument2.spark

###END SCRIPT###