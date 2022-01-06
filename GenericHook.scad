$fa = 1;
$fs = 0.1;

include <config.scad>;
use <SquareHookBase.scad>;

module GenericHook(radius=12, inverted = false){
    scaleFactor = 1.1;
    hookRotationAngle = 180 + 30;
    hookDirection = inverted ? -1 : 1;
    
    union(){
        // Base geometry
        SquareHookBase();

        // Hook arc
        scale([scaleFactor, 1, scaleFactor])
        translate([radius,0])
        rotate_extrude(angle=hookDirection * hookRotationAngle, convexity=10)
        translate([-radius,0])
        square(hookWidth/scaleFactor);
    }
}

GenericHook();

translate([35, 0, 0])
GenericHook(inverted=true);