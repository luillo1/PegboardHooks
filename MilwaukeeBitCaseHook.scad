$fa = 1;
$fs = 0.1;

include <config.scad>;
use <SquareHookBase.scad>;

module MilwaukeeBitHolderHook(){
    armLength = 32.5;
    braceSideLength = 16;

    union(){
        // Base geometry
        SquareHookBase();

        // Attachment arm for case
        union(){
            translate([armLength, 0, 0])
            cube([hookWidth, 1.3*hookWidth, hookWidth]);
            cube([armLength, hookWidth, hookWidth]);
        }
        
        // Diagonal brace
        difference(){
             cube([braceSideLength, braceSideLength, hookWidth]);
             translate([braceSideLength, braceSideLength, hookWidth/2])
             rotate([0, 0, -45])
             cube([braceSideLength*sqrt(2), braceSideLength*sqrt(2), hookWidth+1], center=true);
        }
    }
}

MilwaukeeBitHolderHook();