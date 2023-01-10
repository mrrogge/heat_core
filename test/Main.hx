using buddy.Should;
using Lambda;

import heat.core.*;

class Main extends buddy.SingleSuite {
    public function new() {
        describe("For float vectors: ", {
            it("Adding mutable plus immutable returns mutable (following LHS)", {
                var mutable = new MVectorFloat2();
                var immutable = new VectorFloat2();
                (mutable + immutable).should.beType(MVector2);
            });
            it("Adding immutable plus mutable returns immutable (following LHS)", {
                var immutable = new VectorFloat2();
                var mutable = new MVectorFloat2();
                (immutable + mutable).should.beType(Vector2);
            });
            it("Subtracting immutable from mutable returns mutable (following LHS)", {
                var mutable = new MVectorFloat2();
                var immutable = new VectorFloat2();
                (mutable - immutable).should.beType(MVector2);
            });
            it("Subtracting mutable from immutable returns immutable (following LHS)", {
                var immutable = new VectorFloat2();
                var mutable = new MVectorFloat2();
                (immutable - mutable).should.beType(Vector2);
            });
        });
    };
}