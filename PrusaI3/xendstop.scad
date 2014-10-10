use <stop-switch.scad>
import ("xendstopstl.stl", convexity = 5);

//stop_switch();


//translate([14.07,6+45,0]) color("green") cylinder(h=6, r=3.97, $fn=64);
//%translate([14.07,6,0]) color("red") cylinder(h=6, r=6, $fn=64);
//translate([0,6,0]) color("red") cube([10,55,6]);
// difference() {
//   union() {
//     translate([6,6,0]) color("red") cylinder(h=6, r=6, $fn=64);
//     translate([0,6,0]) color("red") cube([10,55,6]);
//     translate([6,0,0]) color("red") cube([8,12,6]);
//     translate([14.07,6,0]) color("red") cylinder(h=6, r=6, $fn=64);
//   }
//   translate([14.07,6,-0.1]) color("red") cylinder(h=7, r=4, $fn=64);
//}
%translate([16.6,1.7,0]) color("red") cube([1,8.7,6]);
%translate([16.6,1.7,0]) color("red") cylinder(h=6, r=1, $fn=64);
%translate([16.6,10.3,0]) color("red") cylinder(h=6, r=1, $fn=64);