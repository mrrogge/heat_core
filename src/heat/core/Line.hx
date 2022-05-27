package heat.core;

import heat.core.Vector2;

class Line {
    public var x1:Float;
    public var y1:Float;
    public var x2:Float;
    public var y2:Float;

    public function new(x1=0., y1=0., x2=0., y2=0.) {
        init(x1, y1, x2, y2);
    }

    public static function fromVectors(v1:Vector2<Float>, v2:Vector2<Float>):Line {
        return new Line(v1.x, v1.y, v2.x, v2.y);
    }

    public function init(x1=0., y1=0., x2=0., y2=0.):Line {
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        return this;
    }
}