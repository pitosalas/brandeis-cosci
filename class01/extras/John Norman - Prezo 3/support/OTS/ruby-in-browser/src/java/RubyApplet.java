import java.applet.Applet;
import java.util.ArrayList;

import java.io.Writer;
import java.io.StringWriter;
import java.io.PrintWriter;

import org.jruby.Ruby;
import org.jruby.RubyRuntimeAdapter;
import org.jruby.javasupport.JavaEmbedUtils;
import org.jruby.RubyInstanceConfig;
import org.jruby.CompatVersion;

public class RubyApplet extends Applet {

  private Ruby ruby;
  private RubyRuntimeAdapter rra;

  public void init() {
    super.init();
    RubyInstanceConfig ric = new RubyInstanceConfig();
    ric.setCompatVersion(CompatVersion.RUBY1_9);
    ruby = JavaEmbedUtils.initialize(new ArrayList(), ric);
    rra = JavaEmbedUtils.newRuntimeAdapter();
  }

  private boolean started = false;
  public boolean hasStarted() {
    return this.started;
  }
  public void started() {
    this.started = true;
  }
  public void start() {
    super.start();
    this.started();
  }

  public String evalRuby(String code) {
    try {
      Object o = rra.eval(ruby, code);
      return o.toString();
    } catch (Exception e) {
			// return e.getClass().getName();
      // return e.toString();
						final Writer result = new StringWriter();
			    	final PrintWriter printWriter = new PrintWriter(result);
			    	e.printStackTrace(printWriter);
			    	return result.toString();
    }
  }

  // works fine outside browser
  public static void main(String[] args) {
    RubyApplet ra = new RubyApplet();
    ra.init();
    System.out.println(ra.evalRuby("RUBY_VERSION"));
  }

}
