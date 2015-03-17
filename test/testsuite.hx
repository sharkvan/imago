package test;

import haxe.unit.TestRunner;

class TestSuite
{
    public static function main()
    {
        var r = new TestRunner();
        r.add(new Lister_Test());
        // ...

        r.run();
    }
}
