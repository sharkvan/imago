import Sys.*;

class Lister_Sys {
  static public function main():Void {
    trace("Provide a source URL: ");
    var url = stdin().readLine();
    trace('Pulling image urls from: $url');
  }
}