package test;

import haxe.unit.TestCase;
using StringTools;
using test.TestCaseExtender;

class Lister_Test extends TestCase
{
    // It ensures returned urls are fully qualified
    @:access(Lister)
    public function testUrlsAreFullyQualified() {
        var host = "http://www.example.com";
        var actual = Lister.clean("/a.png", host);
        assertTrue(actual.startsWith(host));
    }

    // It ensures paths are clean
    @:access(Lister)
    public function testUrlsAreClean() {
        var host = "http://www.example.com/";
        var actual = Lister.clean("/a.png", host).replace("http://", "");
        assertEquals(actual.indexOf("//"), -1);
    }

    // It finds the Google daily logo
    public function testItFindsImgs() {
        var host = "http://www.google.com/";
        var actual = Lister.get(host);
        assertTrue(actual.length >= 1);
    }

    // It throws on bad urls
    public function testItThrowsOnBadUrls() {
        assertThrows(function() { Lister.get("foo"); });
    }
}
