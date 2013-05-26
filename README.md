CodeSparks 
==========
#### by J.Bean

## Whazat?
CodeSparks is the fastest way I can think of to setup a working CodeIgniter environment.

It features:
* Neat template features like preinstalled assets folders, core headers/footers, view/scaffolded organization
* Some helper functions I use for loading assets, URLs, partials and views
* Basic (for now) scaffold generation from bash/shell.
* Environment configurability
* Automated Apache set up
* Ability to select mixins that you might find useful

Coming maybe:
* More scaffold generation features
* More mixins (gimme ideas)
* Documentation on the helpers, scaffolding

## INSTALLATION

### To install vanilla Sparks
Run this at your terminal (where testsite is the folder to install the domain)

    curl -L  https://github.com/JustinWUP/codesparks/raw/master/cs_install.sh | sh -s testsite

Your site will be at ~/Sites/testsite and online at testsite.spark


### To install with mixins
After the testsite parameter, add mixin names lowercase, comma separated.

i.e.

    curl -L  https://github.com/JustinWUP/codesparks/raw/master/cs_install.sh | sh -s testsite compass

or

    curl -L  https://github.com/JustinWUP/codesparks/raw/master/cs_install.sh | sh -s testsite compass,doctrine

Mixins installers will download/setup everything you need for those particular tools via the curl script.

### Available mixins
So far, I have:

* Compass (SASS compiler)
* Doctrine (a better ORM) 

Please suggest other things that are valuable that you want to use.

### Scaffolding
Where 'scaffold-name' is the name of the view and controller you want to generate, from project root run:

    ./scaffold.sh scaffold-name 
    
More features coming one day.

### Dependencies
* Unix based OS or dev environment (Mac, Linux, CYGWIN) 
* wget, curl (obviously), perl, tar
* Apache and Virtual Hosts turned on (Here's a decent article if you don't know how to do that - http://bit.ly/173lfH8)
* PHP and MySQL (unless you favor another DB)
* Ruby/Rubygems (for Compass)
