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
        var host = "www.example.com/";
        var actual = Lister.clean("/a.png", host);
        assertEquals(actual.indexOf("//"), -1);
    }

    // It finds src attributes on legit img tags
    public function testItFindsImgs() {
        var html = "<html><blah><img src='a.png' /><img class='foo' src=b.png></img><img /></blah></html>";
        var actual = Lister.findImgs(html, "http://www.example.com");
        assertEquals(actual.length, 2);
        assertEquals(actual[0], "http://www.example.com/a.png");
        assertEquals(actual[1], "http://www.example.com/b.png");
    }

    // It throws on bad urls
    public function testItThrowsOnBadUrls() {
        assertThrows(function() { Lister.get("foo"); });
    }
}
