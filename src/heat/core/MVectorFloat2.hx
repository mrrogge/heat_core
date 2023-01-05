package heat.core;

@:forward
@:forwardStatics
abstract MVectorFloat2(MVector2<Float>) from MVector2<Float> to MVector2<Float> 
{
    public inline function new(x=0., y=0.) {
        this = new MVector2<Float>(x, y);
    }

    public inline function lengthSquared():Float {
        return this.x*this.x + this.y*this.y;
    }

    public inline function length():Float {
        return Math.sqrt(lengthSquared());
    }

    public static inline function distSquared(v1:MVectorFloat2, v2:MVectorFloat2):Float {
        return (v1.x-v2.x)*(v1.x-v2.x) + (v1.y-v2.y)*(v1.y-v2.y);
    }

    public inline function distSquaredFrom(other:MVectorFloat2):Float {
        return distSquared(this, other);
    }

    public static inline function dist(v1:MVectorFloat2, v2:MVectorFloat2):Float {
        return Math.sqrt(distSquared(v1, v2));
    }

    public inline function distFrom(other:MVectorFloat2):Float {
        return dist(this, other);
    }

    /**
        Add two vectors, returning a new vector.
    **/
    public static inline function add(v1:MVectorFloat2, v2:MVectorFloat2):MVectorFloat2 {
        return new MVectorFloat2(v1.x + v2.x, v1.y + v2.y);
    }


    @:op(A+B)
    inline function op_add(other:MVectorFloat2):MVectorFloat2 {
        return add(this, other);
    }

    /**
        Add a vector to this one in place.
    **/
    public function addWith(other:MVectorFloat2):MVectorFloat2 {
        this.x += other.x;
        this.y += other.y;
        return this;
    }

    /**
        Subtract two vectors, returning a new vector.
    **/
    public static inline function sub(v1:MVectorFloat2, v2:MVectorFloat2):MVectorFloat2 {
        return new MVectorFloat2(v1.x - v2.x, v1.y - v2.y);
    }

    @:op(A-B)
    public inline function op_sub(other:MVectorFloat2):MVectorFloat2 {
        return sub(this, other);
    }

    /**
        Subtract a vector from this one in place.
    **/
    public function subWith(other:MVectorFloat2):MVectorFloat2 {
        this.x -= other.x;
        this.y -= other.y;
        return this;
    }

    /**
        Multiply vector by a scalar in place.
    **/
    public function multiplyBy(scale:Float):MVectorFloat2 {
        this.x *= scale;
        this.y *= scale;
        return this;
    }

    /**
        Multiply vector by a scalar, returning a new vector.
    **/
    @:op(A*B)
    @:commutative
    public inline function op_multScalar(scale:Float):MVectorFloat2 {
        return new MVectorFloat2(this.x * scale, this.y * scale);
    }

    /**
        Multiply vector by a scalar in place.
    **/
    @:op(A*=B)
    public inline function op_multAssignScalar(scale:Float):MVectorFloat2 {
        return multiplyBy(scale);
    }

    /**
        Dot product of two vectors.
    **/
    @:op(A*B)
    public inline function op_multVector(other:MVectorFloat2):Float {
        return dotWith(other);
    }

    /**
        Divide vector by a scalar in place.
    **/
    public function divideBy(scale:Float):MVectorFloat2 {
        this.x /= scale;
        this.y /= scale;
        return this;
    }

    /**
        Divide vector by a scalar, returning a new vector.
    **/
    @:op(A/B)
    public inline function op_divScalar(scale:Float):MVectorFloat2 {
        return new MVectorFloat2(this.x / scale, this.y / scale);
    }

    /**
        Negate a vector, returning a new vector.
    **/
    @:op(-A)
    public inline function op_negate():MVectorFloat2 {
        return new MVectorFloat2(-this.x, -this.y);
    }

    /**
        Negate a vector in place.
    **/
    public function negate():MVectorFloat2 {
        this.x *= -1;
        this.y *= -1;
        return this;
    }

    public static inline function dot(v1:MVectorFloat2, v2:MVectorFloat2):Float {
        return v1.x*v2.x + v1.y*v2.y;
    }

    /**
        Dot product of this vector with another vector.
    **/
    public inline function dotWith(other:MVectorFloat2):Float {
        return dot(this, other);
    }

    /**
        Cross product of two vectors.
        
        Returns a Float corresponding to the 3rd dimensional component of the cross product. The sign follows right-hand rule convention.

        (TODO: maybe consider changing this to return a VectorFloat3?)
    **/
    public static inline function cross(v1:MVectorFloat2, v2:MVectorFloat2):Float {
        return v1.x*v2.y - v1.y*v2.x;
    }

    /**
        Cross product of this vector with another vector.
    **/
    public inline function crossWith(other:MVectorFloat2):Float {
        return cross(this, other);
    }

    /**
        Multiplies the matching components of the vectors together, returning a new vector.
    **/
    public static inline function multiplyByParts(v1:MVectorFloat2, v2:MVectorFloat2):MVectorFloat2 {
        return new MVectorFloat2(v1.x*v2.x, v1.y*v2.y);
    }

    /**
        Multiplies matching components with another vector in place.
    **/
    public function multiplyByPartsWith(other:MVectorFloat2):MVectorFloat2 {
        this.x *= other.x;
        this.y *= other.y;
        return this;
    }

    /**
        Check if this vector has the same part values as another vector. Returns a corresponding Bool value.
    **/
    public inline function isSameAs(other:MVectorFloat2):Bool {
        return MVectorFloat2.areSame(this, other);
    }

    /**
        Check if this vector has the same part values as another vector. Returns a BoolVector2 with part values corresponding to the comparison results.
    **/
    // public function isSameByParts(other:MVectorFloat2):BoolVector2 {
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
        Normalize this vector in place to a length of 1.

        Does not modify the vector if it has a length of zero.
    **/
    public function normalize():MVectorFloat2 {
        if (this.x == 0 && this.y == 0) return this;
        var length = length();
        this.x /= length;
        this.y /= length;
        return this;
    }
}