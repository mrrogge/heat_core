package heat.core;

@:forward
abstract MFloatVector2(MVector2<Float>) from MVector2<Float> to MVector2<Float> 
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

    public inline function distSquared(other:MFloatVector2):Float {
        var dx = this.x - other.x;
        var dy = this.y - other.y;
        return dx*dx + dy*dy;
    }

    public inline function dist(other:MFloatVector2):Float {
        return Math.sqrt(distSquared(other));
    }
}