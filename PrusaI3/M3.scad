fn = 36;

module M3(length) {
   color("DimGray")
	union(){
	translate([0, 0, 0]) cylinder(h = length, r = 1.5, center = false, $fn = fn);
	render() difference() {
		translate([0, 0, length]) cylinder(h = 3, r = 2.8, center = false, $fn = fn);
		translate([0, 0, length + 1.71]) cylinder(h = 1.3, r = 1.25, center = false, $fn = 6);
	}
  }
}


module M3Hole() {
  translate([0, 0, 2.0]) cylinder(h=3.03, d=6, $fn = fn);	
  translate([0, 0, 0.0]) cylinder(h=2.02, d=3, $fn = fn);	
}


module M3Nut() render(){
   translate([0,0,-1.2])
	intersection() {
		scale([1, 1, 0.5]) sphere(r = 3.75, center = true);
		difference() {
  			cylinder (h = 2.4, r = 3.13, center = true, $fn = 6);
			cylinder(h = 2.4 + 0.1, r = 1.5, center = true, $fn = fn);
		}
  }

}

module M3NutHole() {
  translate([0,0,-2.7])
  union() {
   cylinder(h=2.4, r=3, $fn = 6);	
	translate([0,0,2.39]) cylinder(h=0.3, r1=3, r2=3.3, $fn = 6);	
  }
}


module M3Knob() 
{
  color("lightblue")
  translate([0,0,-1])
  union() {
    difference() {
      cylinder(h=5, r1=4, r2=4.8, $fn=36); 
      translate([0,0,-0.01]) cylinder(h=4.02, r=2.75, $fn=36); 
    }
    translate([0,0,2.7]) cylinder(h=1.3, r=1.2, $fn=6);
    translate([0,0,5]) difference() {
      cylinder(h=2, r=6.5, $fn=36);
      union() {
        for(i = [0:7]) {
          assign (alpha = i * 360 / 8)
          rotate(alpha, [0, 0, 1])
          translate([0,7.5,-0.01]) cylinder(h=2.02, r=2, $fn=36);
        }
      }
    }
  }
}

difference() {
translate([-10,-10,-10]) cube([20, 20, 10]);
translate([0,0,0.02]) M3NutHole();
}
translate([0,0,3]) M3Nut();