package heat.core;

/**
    Common interface for 2-component vectors. See Vector2 and MVector2.
**/
interface IVector2<T> {
    public var x(get, never):T;
    public var y(get, never):T;
}