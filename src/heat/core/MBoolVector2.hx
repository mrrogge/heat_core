package heat.core;

@:forward
abstract MBoolVector2(MVector2<Bool>) from MVector2<Bool> to MVector2<Bool> 
{
    public inline function new(x=false, y=false) {
        this = new MVector2<Bool>(x, y);
    }
}