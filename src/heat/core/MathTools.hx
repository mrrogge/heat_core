package heat.core;

class MathTools {
    /// Acceptable floating-point error for comparison operations.
    final FP_ERR = 
    #if (heat_fp_err >= 0)
    haxe.macro.Context.definedValue("heat_fp_err");
    #elseif (heat_fp_err < 0)
    0;
    #else
    1e-10;
    #end

    public static inline function nearest(cls:Class<Math>, x:Float, a:Float, b:Float):Float {
        return (Math.abs(a-x) < Math.abs(b-x)) ? a : b;
    }
}