citemplate
==========

My personal codeigniter template.

## Other stuff to setup:

1. Edit your /etc/hosts file

    127.0.0.1 www.YOURDEVSITE.com

2. Edit your Apache root .htaccess to read this way

    RewriteEngine On
    
    RewriteCond %{HTTP_HOST} ^(www\.)?YOURDEVSITE\.com$ [NC]
    
    RewriteCond %{REQUEST_URI} !^/~USERNAME/PATHTOYOURDEVSITE
    
    RewriteRule ^(.*)$ /~USERNAME/PATHTOYOURDEVSITE/$1 [L]
    

3. Add this to your /private/etc/apache2/extra/httpd-vhosts.conf

    <VirtualHost *:80>
        ServerName YOURDEVSITE.com
        DocumentRoot /Users/USERNAME/Sites/PATHTOYOURDEVSITE
        <Directory /Users/USERNAME/Sites/PATHTOYOURDEVSITE>
            AllowOverride All
            Options +FollowSymLinks
            Order allow,deny
            Allow from All
		</Directory>
    </VirtualHost>

4. Restart Apache

    $>>> sudo apachectl restart

