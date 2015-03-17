//package haxe;

class Lister {
  static public function get(url:String):Void {
    var http = new haxe.Http(url);

    http.onData = function(resp) {
      trace(resp);
    };

    http.onError = function(err) {
      trace('ERROR: $err');
    };

    http.request();
  }
}
