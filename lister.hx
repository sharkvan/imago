//package haxe;

class Lister {
  static public function get(url:String):Array<String> {
    var http = new haxe.Http(url);
    var hits = [];

    http.onData = function(resp) {
      var rgx = ~/<img [^>]+src=([^ ]+) [^>]+/s;

      while (rgx.match(resp)) {
        var hit = rgx.matched(1);
        hits.push(hit);
        trace(hit);
        resp = rgx.matchedRight();
      }

      trace(hits.length);
    };

    http.onError = function(err) {
      trace('ERROR: $err');
    };

    http.request();

    return hits;
  }
}
