import Sys.*;

class Lister_Sys {
  static var defaultUrl : String = "http://www.google.com";

  static public function main():Void {


    trace('Please provide a target url, or enter for default ($defaultUrl):');
    var input = stdin().readLine();
    var url = switch(input) { case "": defaultUrl; case _: input; }


    trace('Listing image urls found at location: $url');
    trace("---");

    Lister.get(url);

    trace("---");
    trace("Finished.");
    //stdin().readLine();
  }
}
