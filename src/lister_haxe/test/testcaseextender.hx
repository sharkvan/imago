package test;

import haxe.unit.TestCase;

class TestCaseExtender {
    static public function assertThrows(t:TestCase, fn : Void -> Void) {
        var threw = false;

        try { fn(); }
        catch (e:Dynamic) { threw = true; }

        t.assertTrue(threw);
    }
}
