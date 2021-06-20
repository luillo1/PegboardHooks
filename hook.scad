$fa = 1;
$fs = 0.1;

module AttachmentRound() {
    hookRotationAngle = 150;
    hookRotationRadius = 4.5;
    hookLength = 7;
    hookDiameter = 4.5;
    cuttoutWidth = 5;
    
    difference() {
        // Hook shape
        union(){
            translate([-hookRotationRadius,0])
            rotate([90,0,hookRotationAngle])
            translate([hookRotationRadius,0,-hookLength])
            cylinder(h=hookLength, d=hookDiameter);

            translate([-hookRotationRadius,0])
            rotate_extrude(angle=hookRotationAngle, convexity=10)
            translate([hookRotationRadius,0]) circle(d=hookDiameter);

            rotate([90,0,0])
            cylinder(h=33, d=hookDiameter);

            translate([0,-25,0])
            rotate([0,-90,0])
            cylinder(h=8, d=hookDiameter);
            }
        
        // Square cuttout 
        translate([-hookRotationRadius,,0])
        rotate([0,0,-5])
        cube(cuttoutWidth, center=true);
        }
    }
    
module AttachmentSquare() {
    hookRotationAngle = 150;
    hookRotationRadius = 4.5;
    hookLength = 7;
    hookWidth = 4.5;
    cuttoutWidth = 5;
    
    difference() {
        // Hook shape
        union(){
            translate([-hookRotationRadius,0,0])
            rotate([0,0,hookRotationAngle])
            translate([hookRotationRadius,0,0])
            translate([0,hookLength/2,0])
            cube([hookWidth, hookLength, hookWidth], center=true);

            translate([-hookRotationRadius,0])
            rotate_extrude(angle=hookRotationAngle, convexity=10)
            translate([hookRotationRadius,0]) square(hookWidth, center=true);
           
            translate([0,-33/2])
            cube([hookWidth, 33, hookWidth], center = true);
  
            translate([0,-25,0])
            rotate([0,-90,0])
            cylinder(h=8, d=hookWidth);
            }
            
        // Square cuttout
        translate([-hookRotationRadius,,0])
        rotate([0,0,-5])
        cube(cuttoutWidth, center=true);
        }
    }
    
AttachmentSquare();