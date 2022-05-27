package heat.core;

import haxe.ds.Vector;

/**
    A mutable vector with 2 components.
**/
abstract MVector2<T>(Vector<T>) from Vector<T> to Vector<T> {
    public var x(get, set):T;
    public var y(get, set):T;

    public inline function new(?x:T, ?y:T) {
        this = new Vector<T>(2);
        init(x, y);
    }

    public inline function init(?x:T, ?y:T):MVector2<T> {
        if (x != null) this[0] = x;
        if (y != null) this[1] = y;
        return this;
    }

    public inline function get_x():T {
        return this[0];
    }

    public inline function get_y():T {
        return this[1];
    }

    public inline function set_x(x:T):T {
        this[0] = x;
        return x;
    }

    public inline function set_y(y:T):T {
        this[1] = y;
        return y;
    }
}