package heat.core;

class MRect {
    public var x:Float;
    public var y:Float;
    public var w:Float;
    public var h:Float;

    public function new(x=0., y=0., w=0., h=0.) {
        init(x, y, w, h);
    }

    public function init(x=0., y=0., w=0., h=0.):MRect {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        return this;
    }

    public static function isAlike(r1:MRect, r2:MRect):Bool {
        return r1.x == r2.x && r1.y == r2.y && r1.w == r2.w && r1.h == r2.h;
    }

    public function pullFrom(source:MRect):MRect {
        init(source.x, source.y, source.w, source.h);
        return this;
    }

    public function containsPoint(x:Float, y:Float, tol=1e-7):Bool {
        return x-this.x >= tol && y-this.y >= tol && this.x+this.w-x >= tol 
            && this.y+this.h-y >= tol;
    }

    public function clone():MRect {
        return new MRect(this.x, this.y, this.w, this.h);
    }

    public function toString():String {
        return 'MRect{${this.x}, ${this.y}, ${this.w}, ${this.h}}';
    }
}