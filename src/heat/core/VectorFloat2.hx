package heat.core;

@:forward
@:forwardStatics
abstract VectorFloat2(Vector2<Float>) from Vector2<Float> to Vector2<Float> {
    public inline function new(x=0., y=0.) {
        this = new Vector2<Float>(x, y);
    }

    public inline function lengthSquared():Float {
        return this.x*this.x + this.y*this.y;
    }

    public inline function length():Float {
        return Math.sqrt(lengthSquared());
    }

    public inline function distSquared(other:VectorFloat2):Float {
        var dx = this.x - other.x;
        var dy = this.y - other.y;
        return dx*dx + dy*dy;
    }

    public inline function dist(other:VectorFloat2):Float {
        return Math.sqrt(distSquared(other));
    }

    /**
        Add two vectors, returning a new vector.
    **/
    @:op(A+B)
    public inline function op_add(other:VectorFloat2):VectorFloat2 {
        return new VectorFloat2(this.x + other.x, this.y + other.y);
    }

    /**
        Subtract two vectors, returning a new vector.
    **/
    @:op(A-B)
    public inline function op_sub(other:VectorFloat2):VectorFloat2 {
        return new VectorFloat2(this.x - other.x, this.y - other.y);
    }

    /**
        Multiply vector by a scalar, returning a new vector.
    **/
    @:op(A*B)
    @:commutative
    public inline function op_multScalar(scale:Float):VectorFloat2 {
        return new VectorFloat2(this.x * scale, this.y * scale);
    }

    /**
        Dot product of two vectors.
    **/
    @:op(A*B)
    @:commutative
    public inline function op_multVector(other:VectorFloat2):Float {
        return dotWith(other);
    }

    /**
        Divide vector by a scalar, returning a new vector.
    **/
    @:op(A/B)
    public inline function op_divScalar(scale:Float):VectorFloat2 {
        return new VectorFloat2(this.x / scale, this.y / scale);
    }

    /**
        Negate a vector, returning a new vector.
    **/
    @:op(-A)
    public inline function op_not():VectorFloat2 {
        return new VectorFloat2(-this.x, -this.y);
    }

    public static inline function dot(v1:VectorFloat2, v2:VectorFloat2):Float {
        return v1.x*v2.x + v1.y*v2.y;
    }

    /**
        Dot product of this vector with another vector.
    **/
    public inline function dotWith(other:VectorFloat2):Float {
        return dot(this, other);
    }

    /**
        Cross product of this vector with another vector.
        
        Returns a Float corresponding to the 3rd dimensional component of the cross product. The sign follows right-hand rule convention.

        (TODO: maybe consider changing this to return a VectorFloat3?)
    **/
    public inline function cross(other:VectorFloat2):Float {
        return this.x*other.y - this.y*other.x;
    }

    /**
        Multiplies the matching components of the vectors together, returning a new vector.
    **/
    public static inline function multiplyByParts(v1:VectorFloat2, v2:VectorFloat2):VectorFloat2 {
        return new VectorFloat2(v1.x*v2.x, v1.y*v2.y);
    }

    /**
        Check if this vector has the same part values as another vector. Returns a corresponding Bool value.
    **/
    public inline function isSameAs(other:VectorFloat2):Bool {
        return VectorFloat2.areSame(this, other);
    }

    /**
        Check if this vector has the same part values as another vector. Returns a BoolVector2 with part values corresponding to the comparison results.
    **/
    // public function isSameByParts(other:VectorFloat2):BoolVector2 {
    //     var result = new BoolVector2();
    //     result.x = this.x == other.x;
    //     result.y = this.y == other.y;
    //     return result;
    // }

    /**
        Returns the angle (in radians) corresponding to the vector's parts (i.e. Cartesian to polar conversion).
    **/  
    public inline function angle():Float {
        return Math.atan2(this.y, this.x);
    }

    /**
        Returns a new vector with the same angle as this, normalized to a length of 1.

        If the vector has a length of zero, then this method returns the same vector, i.e. without copying it.
    **/
    public inline function normalize():VectorFloat2 {
        return if (this.x == 0 && this.y == 0) {
            this;
         }
         else {
            var length = length();
            new VectorFloat2(this.x/length, this.y/length);
         };
    } 
}