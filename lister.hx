//package std.haxe.io;
//typedef StringInput = std.haxe.io.StringInput;
//typedef stdin = Sys.stdin;
import Sys.*;

class Lister {
  static public function main():Void {
    trace("Provide a source URL: ");
    var url = stdin().readLine();
    trace('Pulling image urls from: $url');
  }
}