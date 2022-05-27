package heat.core;

@:forward
abstract MFloatVector2(MVector2<Float>) from MVector2<Float> to MVector2<Float> 
{
    public inline function new(x=0., y=0.) {
        this = new MVector2<Float>(x, y);
    }
}