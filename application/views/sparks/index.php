<h1>Welcome to CodeSparks.</h1>
<hr>
<h3>Some differences from stock CodeIgniter</h3>
<ul>
	<li>Set your environment variable in application/config/environment.php and 
		then use the corresponding environment folders in application/config for database and app setup.</li>
	<li>Assets are in the assets folder and there are url helpers preinstalled to access things there
		(get info on those in helpers/sparks_helper.php.</li>
	<li>There are header and footer partials pre-installed that have all the extraneous stuff I use for those things
		are included to reduce clutter in views.</li>
	<li>Your header, footer and other partials get loaded into views by the decidedly more consise function
		partial('partialname'); </li>
