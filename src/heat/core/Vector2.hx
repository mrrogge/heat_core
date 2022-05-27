package heat.core;

/**An immutable vector with 2 components.**/
class Vector2<T> {
    public var x(default, null):T;
    public var y(default, null):T;

    public function new(x:T, y:T) {
        this.x = x;
        this.y = y;
    }
}