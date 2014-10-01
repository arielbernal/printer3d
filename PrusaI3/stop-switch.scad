use <primitives.scad>

module stop_switch() {
difference() {
  union() {
    cube([40,1.75,16.25]);
    color("silver") translate([18.5,1.75+5.70/2-2,16.25]) rotate([0,10,0]) translate([-15.5,0,0]) cube([15.5,4,0.35]);
    color("white") translate([6.3,1.75,16.25-9]) cube([13,5.70,4.5]);
    color("grey") translate([6.3,1.75,16.25-4.5]) cube([13,5.70,4.5]);
    color("white") translate([26-2,1.75,16.25/2-6.25]) cube([6,10,12.5]);
    color("Grey") rotate([0,0,180]) 
       translate([-27.5,0,0]) triangular_prism(4,2,16.25);
    color("Grey") translate([6,0,6.5]) rotate([0,-90,180]) triangular_prism(4,2,12.5);

  }
  translate([3,-0.01,16.25-3]) rotate([-90,0,0]) cylinder(h=1.77,r=2,$fn=36);
  translate([22.5,-0.01,16.25-3]) rotate([-90,0,0]) cylinder(h=1.77,r=2,$fn=36);
  translate([40-3,-0.01,16.25-3]) rotate([-90,0,0]) cylinder(h=1.77,r=2,$fn=36);
  translate([40-3,-0.01,3]) rotate([-90,0,0]) cylinder(h=1.77,r=2,$fn=36
);

}
}

stop_switch();