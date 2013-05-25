CodeSparks
==========

CodeSparks is the official J.Bean personal CodeIgniter template.

## TO INSTALL VANILLA SPARKS
Run this at your terminal (where testsite is the folder to install the domain)

    curl -L  https://github.com/JustinWUP/citemplate/raw/master/ci_install.sh | sh -s testsite

Your site will be at ~/Sites/testsitegit and online at testsite.spark


## TO INSTALL WITH MIXINS
After the testsite parameter, add mixin names with comma separated values.

    curl -L  https://github.com/JustinWUP/citemplate/raw/master/ci_install.sh | sh -s testsite mixin1,mixin2

## AVAILABLE MIXINS
So far, I have Compass (SASS) and Doctrine (ORM) but please suggest other things that are valuable that you want to use.

Enter mixin name lowercase in the curl script
i.e.
    curl -L  https://github.com/JustinWUP/citemplate/raw/master/ci_install.sh | sh -s testsite compass

or
    curl -L  https://github.com/JustinWUP/citemplate/raw/master/ci_install.sh | sh -s testsite compass,doctrine

## DEPENDENCIES
* Unix based OS or dev environment (Mac, Linux, CYGWIN) 
* Apache and Virtual Hosts turned on (Here's a decent article if you don't know how to do that - http://bit.ly/173lfH8)
* Ruby/Rubygems (for Compass)
