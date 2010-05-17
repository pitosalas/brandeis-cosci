Ruby in Slidy
13-July-2007

1. Download the following:

Slidy: http://www.w3.org/Talks/Tools/Slidy
 Zip: http://www.w3.org/Talks/Tools/Slidy/slidy.zip
 
Ruby-in-browser: http://ruby-in-browser.googlecode.com/svn/trunk/evalruby/index.html
 svn export http://ruby-in-browser.googlecode.com/svn/trunk/ ruby-in-browser
 (or checkout)
 
Scriptalicious: http://script.aculo.us/
 Zip: http://script.aculo.us/dist/scriptaculous-js-1.7.0.zip

JSON: http://json.org/
 Code: http://www.json.org/json.js

2. After getting these packages, unzip and make sure that the directory layout is like so:

<slideshow>.html
support/
    additional/
    	bullet.png
    	etc.
    OTS/				(means "off-the-shelf")
    	json/
    		json.js
	    ruby-in-browser/
	    	classes/
	    	etc.
		scriptalicious-js/
  			lib/
  			etc.
		Slidy/
  			bullet.png
	  	etc.

3.  copy ruby-in-browser/classes/RubyApplet.class to ruby-in-browser/lib

