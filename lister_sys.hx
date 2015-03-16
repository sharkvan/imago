import Sys.*;

class Lister_Sys {
  static public function main():Void {
    trace("Please provide a target url:");
    var url = stdin().readLine();

    trace('Listing image urls found at location: $url');
  }
}
