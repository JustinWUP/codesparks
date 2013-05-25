<h1>Welcome to CodeSparks.</h1>
<hr>
<h3>Tips and some differences from stock CodeIgniter</h3>
<ul>
	<li>Set your environment variable in application/config/environment.php and <br>
		then use the corresponding environment folders in application/config for database and app setup.</li>
	<li>Assets are in the assets folder and there are url helpers preinstalled to access things there
		(get info on those in helpers/sparks_helper.php.</li>
	<li>There are header and footer partials pre-installed that have all the extraneous stuff<br>
	 	I use for those things are included to reduce clutter in views.</li>
	<li>Your header, footer and other partials get loaded into views by the decidedly more concise function
		<pre>partial('partialname');</pre> </li>
	<li>The helper functions are designed to be used with the php echo helper, like so.
		<pre>&lt;?= link_to('url', image('image.jpg')); ?&gt;</pre></li>
	<li>Your simplest controller looks like this.
		<pre> 	
		class Sparks extends CI_Controller {
			public function index()
			{	
				template();
			}
		]
		</pre>
		The URL for this is yoursite.com/CLASS_NAME/index.<br>
		Every page view request hits the specified template (or in this case default template) first and then includes the view based on the classname/methodname convention.<br>
		The default template is at views/templates/core.php but you can change it or have multiple.
	</li>

</ul>

<h3>Get Started</h3>
<ol>
	<li>Delete this index.php</li>
	<li>Create yourself a view folder and controller</li>
	<li>Change default controller in routes.php to the controller you want</li>
</ol>
