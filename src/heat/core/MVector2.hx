package heat.core;

import haxe.ds.Vector;

/**
    A mutable vector with 2 components.
**/
abstract MVector2<T>(Vector<T>) from Vector<T> to Vector<T> {
    public var x(get, set):T;
    public inline function get_x():T {
        return this[0];
    }
    public inline function set_x(x:T):T {
        this[0] = x;
        return x;
    }

    public var y(get, set):T;
    public inline function get_y():T {
        return this[1];
    }
    public inline function set_y(y:T):T {
        this[1] = y;
        return y;
    }

    public inline function new(x:T, y:T) {
        this = new Vector<T>(2);
        init(x, y);
    }

    public inline function init(x:T, y:T):MVector2<T> {
        this[0] = x;
        this[1] = y;
        return this;
    }

    public inline function initFrom(source:MVector2<T>):MVector2<T> {
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