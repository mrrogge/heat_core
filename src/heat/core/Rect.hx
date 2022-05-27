package heat.core;

class Rect {
    public var x(default, null):Float;
    public var y(default, null):Float;
    public var w(default, null):Float;
    public var h(default, null):Float;

    public function new(x=0., y=0., w=0., h=0.) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    public static function fromCorners(xTopLeft=0., yTopLeft=0., 
    xBottomRight=0., yBottomRight=0.):Rect 
    {
        return new Rect(xTopLeft, yTopLeft, xBottomRight-xTopLeft, 
            yBottomRight-yTopLeft);
    }
}