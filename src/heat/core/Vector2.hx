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
}