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

    CommandLineParser parser = new DefaultParser();

    // System.out.println(args[0]);

    try {
      // parse the command line arguments
      CommandLine cmd = parser.parse( options, args );
    }
    catch( ParseException exp ) {
      // oops, something went wrong
      System.err.println( "Parsing failed.  Reason: " + exp.getMessage() );
    }

    // automatically generate the help statement
    HelpFormatter formatter = new HelpFormatter();
    formatter.printHelp( "ant", options );

  }

}
