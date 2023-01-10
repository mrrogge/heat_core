package heat.core;

@:forward
@:forwardStatics
abstract VectorBool2(Vector2<Bool>) from Vector2<Bool> to Vector2<Bool> {
    public inline function new(x=false, y=false) {
        this = new Vector2<Bool>(x, y);
    }

    /**
        AND two vectors, returning a new vector.
    **/
    @:op(A&&B)
    @:commutative
    inline function op_and(other:IVector2<Bool>):VectorBool2 {
        return new VectorBool2(this.x && other.x, this.y && other.y);
    }

    /**
        OR two vectors, returning a new vector.
    **/
    @:op(A||B)
    @:commutative
    inline function op_or(other:IVector2<Bool>):VectorBool2 {
        return new VectorBool2(this.x || other.x, this.y || other.y);
    }

    /**
        Negate a vector, returning a new vector.
    **/
    @:op(!A)
    inline function op_not():VectorBool2 {
        return new VectorBool2(!this.x, !this.y);
    }

    /**
        Check if this vector has the same part values as another vector. Returns a corresponding Bool value.
    **/
    public inline function isSameAs(other:IVector2<Bool>):Bool {
        return VectorBool2.areSame(this, other);
    }

    public inline function toFloats():VectorFloat2 {
        return new VectorFloat2(this.x ? 1 : 0, this.y ? 1 : 0);
    }

    public static inline function fromFloats(source:IVector2<Float>):VectorBool2 {
        return new VectorBool2(source.x != 0, source.y != 0);
    }
}