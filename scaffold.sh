###BEGIN SCRIPT###

###SCRIPT NAME:  scaffold.sh ###

#!/bin/bash

argument1=$1 
for i in $argument1; do B=`echo "${i:0:1}" | tr a-z A-Z`${i:1}; done

echo 'Generating scaffold...'
mkdir ./application/views/$argument1  
mkdir ./application/views/$argument1/partials  
touch ./application/views/$argument1/index.php

echo "<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');" >> ./application/controllers/$argument1.php
echo " "  >> ./application/controllers/$argument1.php
echo "class $B extends CI_Controller {" >> ./application/controllers/$argument1.php
echo " " >> ./application/controllers/$argument1.php
echo "public function index()" >> ./application/controllers/$argument1.php
echo "	{ " >> ./application/controllers/$argument1.php
echo "		template();" >> ./application/controllers/$argument1.php
echo "    }" >> ./application/controllers/$argument1.php
echo "}  " >> ./application/controllers/$argument1.php

###END SCRIPT###