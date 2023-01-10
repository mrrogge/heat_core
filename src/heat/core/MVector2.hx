package heat.core;

import haxe.ds.Vector;

/**
    A mutable vector with 2 components.
**/
class MVector2<T> implements IVector2<T> {
    public var x(get, set):T;
    inline function get_x():T {
        return _v[0];
    }
    function set_x(x:T):T {
        _v[0] = x;
        return x;
    }

    public var y(get, set):T;
    inline function get_y():T {
        return _v[1];
    }
    function set_y(y:T):T {
        _v[1] = y;
        return y;
    }

    var _v = new Vector<T>(2);

    public function new(x:T, y:T) {
        init(x, y);
    }

    public function init(x:T, y:T):MVector2<T> {
        this.x = x;
        this.y = y;
        return this;
    }

    public inline function initFrom(source:IVector2<T>):MVector2<T> {
        init(source.x, source.y);
        return this;
    }

    public inline function toImmutable():Vector2<T> {
        return new Vector2<T>(x, y);
    }

    public static inline function fromImmutable<T>(immutable:Vector2<T>):MVector2<T> {
        return new MVector2<T>(immutable.x, immutable.y);
    }

    public inline function clone():MVector2<T> {
        return new MVector2<T>(x, y);
    }

    public inline function applyTo(target:MVector2<T>):MVector2<T> {
        target.init(x, y);
        return this;
    }
}