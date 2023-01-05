package heat.core;

/**An immutable vector with 2 components.**/
class Vector2<T> {
    public var x(default, null):T;
    public var y(default, null):T;

    public function new(x:T, y:T) {
        this.x = x;
        this.y = y;
    }

    public function toMutable():MVector2<T> {
        return new MVector2<T>(x, y);
    }

    public static function fromMutable<T>(mutable:MVector2<T>):Vector2<T> {
        return new Vector2<T>(mutable.x, mutable.y);
    }

    public function clone():Vector2<T> {
        return new Vector2(x, y);
    }

    /**
        Compare two vectors by parts, returning true if like parts are all equal (otherwise false).
    **/
    public static inline function areSame<T>(v1:Vector2<T>, v2:Vector2<T>):Bool {
        return v1.x == v2.x && v1.y == v2.y;
    }
}