CodeSparks
==========

CodeSparks is the official J.Bean personal CodeIgniter template.
## INSTALLATION

### To install vanilla Sparks
Run this at your terminal (where testsite is the folder to install the domain)

    curl -L  https://github.com/JustinWUP/citemplate/raw/master/ci_install.sh | sh -s testsite

Your site will be at ~/Sites/testsitegit and online at testsite.spark


### To install with mixins
After the testsite parameter, add mixin names lowercase, comma separated.

i.e.

    curl -L  https://github.com/JustinWUP/citemplate/raw/master/ci_install.sh | sh -s testsite compass

or

    curl -L  https://github.com/JustinWUP/citemplate/raw/master/ci_install.sh | sh -s testsite compass,doctrine

Mixins installers will download/setup everything you need for those particular tools via the curl script.

### Available mixins
So far, I have:

* Compass (SASS compiler)
* Doctrine (a better ORM) 

Please suggest other things that are valuable that you want to use.

### Dependencies
* Unix based OS or dev environment (Mac, Linux, CYGWIN) 
* wget, curl (obviously)
* Apache and Virtual Hosts turned on (Here's a decent article if you don't know how to do that - http://bit.ly/173lfH8)
* Ruby/Rubygems (for Compass)
