//color("red") import ("Switch_M.stl", convexity = 5);
union() {
    translate([-2,0,0]) rotate([0,0,90]) cube([40,40,3.75]);
	difference() {
		rotate([0,-25,0]) translate([-39,0,0.2]) {
		    difference() {
		     union() {
			    cube([39, 3.75, 37.5]);
			    translate([0,40,0]) cube([39, 3.75, 37.5]);
			    cube([3.75, 40, 37.5]);
			    translate([37.5-3.75/2-0.4,0,0]) cube([3.75, 43.8, 37.5]);
			  }
			  translate([10.5,60,35]) rotate([90,0,0]) cylinder(h=80, r=4, $fn=36);
			  translate([30.5,60,35]) rotate([90,0,0]) cylinder(h=80, r=4, $fn=36);
			}
		}
		translate([5,-5,0]) rotate([0,180,0]) cube([50,60,20]);
	}
}