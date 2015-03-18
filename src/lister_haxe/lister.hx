import haxe.io.Path;
using StringTools;

class Lister {
  static public function get(url:String):Array<String> {
    var http = new haxe.Http(url);
    var hits = [];

    http.onData = function(resp) {
      //trace(resp);
      var rgx = ~/<img[^>]+src=([^ >]+)/s;

      while (rgx.match(resp)) {
        hits.push(clean(rgx.matched(1), url));
        resp = rgx.matchedRight();
      }
    };

    http.onError = function(err) {
      trace('ERROR: $err');

      throw err;
    };

    http.request();

    return hits;
  }

  static function clean(hit:String, url:String):String {
    hit = hit.replace('"', '').replace("'", "").trim();

    if (!hit.startsWith(url))
      hit = Path.join([url, hit]);

    return hit;
  }
}
