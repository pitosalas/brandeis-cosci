/* $Id: ruby-control.js 111 2008-03-04 13:50:04Z jgn $ */

var Ruby = {

  init: function() {
    Ruby.applet();
    Ruby.source();
  },

  loaded: false,

  load: function() {
    if (!this.loaded) {
      try {
        document.RubyApplet.evalRuby("");
        this.loaded = true;
      } catch (e) {
        setTimeout("this.load", 100);
      }
    }
  },

  eval: function(code) {
    return document.RubyApplet.evalRuby(code);
  },
 
  evalAddOutput: function(code, irb) {
//    alert(code);
    this.getRubySource();
    var irb_style = irb ? "true" : "false";
    var lines = code.split('\n');

    // trim off 'output' comments (starting with '# ')
    var trimmedCode = "";
    for (var i = 0; i < lines.length; i++) {
      lines[i] = lines[i].replace(/(^#\s.*)|(\s*#=>\s*.*)/g, '');
      if (lines[i].length != 0) {
        trimmedCode = trimmedCode + lines[i] + '\n';
      }
    }
    
    trimmedCode = trimmedCode.replace('\\n', '\\\\n');

    var codeToRun = this.rubySource['xmp']
                  + this.rubySource['pre']
                  + "evaled_code = xmp(<<'EOS'," + irb_style + ")\n" + trimmedCode + "EOS\n"
                  + this.rubySource['post'];
//  alert(codeToRun);
    var result = this.eval(codeToRun);
    return result;
  },

  evalWithEffects: function(id, irb) {
    var e = document.getElementById(id);
    Element.setOpacity(e, 0.25);
    e.value = this.evalAddOutput(e.value, irb);
    new Effect.Appear(e, { duration: 2 });
  },

 applet: function() {
   var applet = document.createElement('applet');
   applet.setAttribute("codebase", "support/OTS/ruby-in-browser/lib/");
   applet.setAttribute("archive", "jruby-complete.jar");
   applet.setAttribute("code", "RubyApplet");
   applet.setAttribute("name", "RubyApplet");
   applet.setAttribute("width", "1");
   applet.setAttribute("height", "1");
   document.body.appendChild(applet);
  },

  /* The idea behind this next bit is that we want to store Ruby code
   * somewhere so that we can send it off to the JRuby applet. However,
   * JavaScript doesn't really have a facility for a "here document,"
   * which would be a nice way to keep the Ruby sources. (To be sure,
   * we could assign the Ruby source to some String variables, but
   * that would require a lot of quoting and escaping and so forth,
   * and would be ugly.)
   *
   * So what we do is this: We put the Ruby source into textarea blocks
   * in a separate file (ruby-source.html), and put that into an iframe.
   * When the iframe is loaded, it finds all of its Ruby sources, and
   * compiles them into a JSON String, which is then encoded and put
   * onto the hash portion of the iframe's URL. From here, this code
   * can pick up the hash, decode it, and then eval it, getting us a
   * a nice associative array, where each key is the name of the script,
   * and the property value is the Ruby code.
   */
  source: function() {
    var iframe = document.createElement('iframe');
    iframe.setAttribute('id', 'ruby-source');
    iframe.setAttribute('height', '1');
    iframe.setAttribute('width', '1');
    iframe.setAttribute('src', 'support/additional/ruby-source.html');
    document.body.appendChild(iframe);
  },

  rubySource: null,

  getRubySource: function() {
    if (!this.rubySource) {
      this.rubySource = eval( "(" + decodeURI(document.getElementById('ruby-source').contentWindow.location.hash.substring(1)) + ")" );
    }
  }

};

var Slidy = {
  intercept: function(event) {
    var target;
    if (event.target) {
      target = event.target;
    } else if (event.srcElement) {
      target = event.srcElement;
    }
    if (target.nodeType == 3) { // Safari
      target = target.parentNode;
    }
    if ((target.className.indexOf("runnable") != -1) || target.className == "controls") {
	    // don't relay events to the Slidy handlers
    } else {
      switch (event.type) {
        case "click": mouseButtonClick(event); break;
        case "mouseup": mouseButtonUp(event); break;
        case "keydown": keyDown(event); break;
        case "scroll": scrolled(event); break;
      }
    }
  }
}

function mov(e) {
  Element.setOpacity(e, 1.0);
}

function mout(e) {
  Element.setOpacity(e, 0.5);
}

function mystart() {
  Ruby.init();
  Ruby.load();
  startup();
  // intercept events before Slidy
  document.onclick = Slidy.intercept;
  document.onmouseup = Slidy.intercept;
  document.onkeydown = Slidy.intercept;
  document.onscroll = Slidy.intercept;
  var elements = document.getElementsByClassName("runnable");
  for (var i = 0; i < elements.length; i++) {
    e = elements[i];
    irb = (e.className.indexOf('irb') != -1)
    var idName = 'runnable' + i;
    e.id = idName;
    var html = "<div class='controls' onmouseover='mov(this)' onmouseout='mout(this)'><button class='controls' onclick='Ruby.evalWithEffects(\"" + idName + "\", document.getElementById(\"" + idName + "irb\").checked)'>&nbsp;Run to End&nbsp;</button>"
//      + "<button>&nbsp;Step&nbsp;</button>"
      + "<input id='" + idName + "irb' type='checkbox' "
      + (irb ? "checked" : "")
      + "/> irb-style</div>";
    new Insertion.After(e, html);
  }
}
