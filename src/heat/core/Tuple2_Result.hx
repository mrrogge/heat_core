package heat.core;

class Tuple2<T0, T1> {
    public var e0(default, null):T0;
    public var e1(default, null):T1;

    public function new(e0:T0, e1:T1) {
        this.e0 = e0;
        this.e1 = e1;
    }
}