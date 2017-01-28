import org.apache.commons.cli.Options;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.ParseException;
import org.apache.commons.cli.HelpFormatter;

public class Main {

  public static void main(final String[] args) {

    // create Options object
    Options options = new Options();

    // add t option
    options.addOption("t", false, "display current time");
    options.addOption("c", true, "country code");

    CommandLineParser parser = new DefaultParser();

    // System.out.println(args[0]);
    CommandLine cmd = null;
    try {
      // parse the command line arguments
      cmd = parser.parse( options, args );
    }
    catch( ParseException exp ) {
      // oops, something went wrong
      System.err.println( "Parsing failed.  Reason: " + exp.getMessage() );
    }

    if(cmd.hasOption("t")) {
      // print the date and time
      System.out.println("hello");
    }
    else if(cmd.hasOption("c")) {
      // get c option value
      String countryCode = cmd.getOptionValue("c");
      if(countryCode == null) {
        // print default date
        System.out.println("hello");
      }
      else {
        // print date for country specified by countryCode
        System.out.println("hello " + countryCode);
      }
    }
    else {
      // automatically generate the help statement
      HelpFormatter formatter = new HelpFormatter();
      formatter.printHelp( "ant", options );
    }

  }

}
