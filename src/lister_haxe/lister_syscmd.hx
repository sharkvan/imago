import Sys.*;

class Lister_SysCmd {
  static var defaultUrl : String = "http://www.google.com";

  static public function main():Void {

    trace('Please provide a target url, or enter for default ($defaultUrl):');
    var input = stdin().readLine();
    var url = switch(input) { case "": defaultUrl; case _: input; }


    trace('Listing image urls found at location: $url');
    trace("---");

    var urls = Lister.get(url);

    for (u in urls)
      trace(u);

    trace("---");
    trace("Finished.");

  }
}
