$fa = 1;
$fs = 0.1;

include <config.scad>;

module SquareHookBase() {
    arcRotationAngle = 150;
    arcRotationRadius = 4.5;
    headLength = 7;
    bodyLength = 33;
    bodyWidth = 4.5;
    cuttoutWidth = 5;
    pinLength = 8;
    
    translate([bodyWidth/2,bodyLength,bodyWidth/2])
    difference() {
        union(){
            // Hook head
            translate([-arcRotationRadius,0,0])
            rotate([0,0,arcRotationAngle])
            translate([arcRotationRadius,0,0])
            translate([0,headLength/2,0])
            cube([bodyWidth, headLength, bodyWidth], center=true);

            // Hook arc
            translate([-arcRotationRadius,0])
            rotate_extrude(angle=arcRotationAngle, convexity=10)
            translate([arcRotationRadius,0])
            square(bodyWidth, center=true);
            
            // Hook body
            translate([0,-bodyLength/2])
            cube([bodyWidth, bodyLength, bodyWidth], center = true);
  
            // Indexing pin
            translate([0,-(bodyLength-8),0])
            rotate([0,-90,0])
            cylinder(h=pinLength, d=bodyWidth);
        }
            
        // Square cuttout for pegboardboard
        translate([-arcRotationRadius,,0])
        rotate([0,0,-5])
        cube(cuttoutWidth, center=true);
    }
}

SquareHookBase();