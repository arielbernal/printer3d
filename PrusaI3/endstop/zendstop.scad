use <nema17.scad>
use <spring.scad>
use <M3.scad>
use <primitives.scad>
use <stop-switch.scad>
use <z-axis-bottom.scad>

fn = 36;

module ztuner()
{
  color("LimeGreen")
  union() {
    difference(){
	   cube([9,41, 5]);
      translate([4.5, 4.5, -0.01]) M3Hole();
      translate([4.5, 31 + 4.5, -0.01]) M3Hole();
      translate([-0.01, 9-0.01, -0.01]) cube([9.02,31-9,2.52]);
    }
    translate([0, 55,5]) rotate([90,0,0]) {
     difference() {
        translate([0,-5,3]) cube([9.5, 18, 12]); 
        translate([4.5,8,3-0.02]) rotate([0,180,0]) M3NutHole();
        translate([4.5, 8, -0.01]) cylinder(h=15.02, r=1.5, $fn=36); 
        translate([4.5, 8, 8.01]) cylinder(h=7, r=2.8, $fn=36); 
      }
    }
  }
}


module round_rect(w, l, h, r, oneside=false)
{
  difference() {
    cube([w, l, h]);
    translate([w/2,r,h/2])
    difference() {
      translate([0,-r/2,-0.01]) cube([w+0.1, r+0.1, h+0.2],center=true);
      cylinder(h=h+0.2,r=r, $fn=36, center=true);
    }
    if (!oneside) {
      translate([w/2,l-r,h/2])
      mirror([0,1,0])difference() {
        translate([0,-r/2,-0.01]) cube([w+0.1, r+0.1, h+0.2],center=true);
        cylinder(h=h+0.2,r=r, $fn=36, center=true);
      }
    }
  }
}

module zholder()
{
  color("LimeGreen")
  union() {
    difference() {
       translate([0,-12,0.01]) cube([11,40,5-0.03]);
       translate([2.5,6,2-0.2]) round_rect(6,20,3+0.3,3);
       translate([2.5+1.5,6+1.5,-0.2]) round_rect(3,17,2+0.3,1.5);
    }
    translate([-31,0,0])
    difference() {
       translate([0,-12,0.01]) cube([11,40,5-0.03]);
       translate([2.5,6,2-0.2]) round_rect(6,20,3+0.3,3);
       translate([2.5+1.5,6+1.5,-0.2]) round_rect(3,17,2+0.3,1.5);
    }
    difference() {
      translate([-31,-14.5,0.01]) cube([54,3,40]);
      translate([-13,-15+2-0.4,6.01]) cube([14,2,30]);
      translate([6.5,-15+2-0.4,6.01]) cube([5,2,30]);
      translate([17,-11.3,6.01]) rotate([90,0,0]) round_rect(3,30,4,1.5, true);
      translate([-17,-11.3,6.01]) rotate([90,0,0]) round_rect(3,30,4,1.5, true);
    }

  }
}



*translate([4.5,-4.5,15]) rotate([0,0,0]) stop_switch();



mirror([0,1,0]) rotate([180,0,0]) translate([-16.25,17,-5]) z_bottom_holder();
translate([13,38,0]) {
  nema17(48);
  translate([31/2,-31/2,-7]) M3(14);
  translate([-31/2,-31/2,-7]) M3(14);
  translate([-31/2,31/2,-9]) M3(14);
  translate([(31-11)/2,-31/2-20+4.5 ,5]) zholder();
}


translate([0,-15.5,80]) rotate([0,90,0])rotate([0,0,-90]){
nema17(48);
translate([31/2-4.5-31, 31/2-4.5-31, 0]) {
  ztuner();
  translate([4.5, 4.5, -11]) M3(14);
  translate([4.5, 31+4.5, -11]) M3(14); 
  translate([4.5, 46, 13])rotate([90, 0, 0]) {
    translate([0, 0, -3.5]) M3Nut();
    translate([0, 0, -20]) M3(30);
    translate([0,0,10.01]) M3Knob();
    coil(2, .3, 10, 8);
  }
}
}

//rotate([0,180,0]) translate([15,0,-6])  M3Knob();
//rotate([0,-90,0])  translate([0,-25,0]) ztuner();
