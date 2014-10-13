use <../PrusaI3/primitives.scad>

module connector(w, t, wall) {
  wc = w + 2 * wall;

color("yellow") {translate([wc, wall+5,wall]) cube([wc,0.5,t]);
translate([wc, wall+5+7,wall]) cube([wc,0.5,t]);
}

color("yellow") {translate([ wall+5,wc, wall]) cube([0.5,wc, t]);
translate([wall+5+7,wc,wall]) cube([0.5,wc, t]);
}

//  color("lightblue")
difference() {
    union() {
      cube([wc,wc,wc]);
      difference() {
       cube([2 * wc,2 * wc, wall + t]);
        translate([wc-0.1, wc-0.1, -0.1]) 
			 cube([wc+0.2,wc+0.2, wall + t+.4]);
      }
      difference() {
        cube([2 * wc, wall + t, 2 * wc]);
        translate([wc-0.2, -0.2, wc-0.2]) 
			 cube([wc+0.3, wall + t+.3,wc+0.3]);

      }
      difference() {
        cube([wall + t, 2 * wc, 2 * wc]);
        translate([ -0.1, wc-0.1, wc-0.1]) 
			 cube([wall + t+.2, wc+0.2, wc+0.2]);
      }

      translate([wc,0,0]) cube([wc,wc,wc]);
      translate([0,wc,0]) cube([wc,wc,wc]);
      translate([0,0,wc]) cube([wc,wc,wc]);
    }
translate([wc, wall+t, wall + t]) rotate([90,0,90]) triangular_prism_rect(3,3,wc+.1);


translate([ wall+t,2*wc+.1,  wall + t]) rotate([90,0,0]) triangular_prism_rect(3,3,wc+.1);

translate([wall+t, wall + t,wc]) rotate([0,0,0]) triangular_prism_rect(3,3,wc+.1);

    translate([2*wall+t,2*wall+t,2*wall+t]) cube([2*wc,2*wc,2*wc]);
    union() {
      translate([wc,wall,wall]) cube([wc+0.1+5, w, t+0.1]);
      translate([wc,wall,wall]) cube([wc+0.1+5, t+0.1, w]);
    }
    union() {
      translate([wall,wc,wall]) cube([w, wc+0.1+5, t+0.1]);
      translate([wall,wc,wall]) cube([t+0.1, wc+0.1+5, w]);
    }
    union() {
      translate([wall,wall,wc]) cube([w, t+0.1, wc+0.1+5]);
      translate([wall,wall,wc]) cube([t+0.1, w, wc+0.1+5]);
    }
  }
}

module bar_angle(w, t, len) {
  color("silver")
  union() {
    cube([len, w, t]);
    cube([len, t, w]);
  }
}



w = 20;
wall = 3;
wc = w + 2 * wall;
t = 2;
ta = 1.26; 
depth = 500;
width = 455.4;
connector(w, t, wall);
//translate([-5,-5,0]) rotate([0,0,180]) connector(w, t, wall);
//translate([-5,0,0]) rotate([0,0,90]) connector(w, t, wall);
//translate([0,-5,0]) rotate([0,0,-90]) connector(w, t, wall);


//translate([0,width,0]) rotate([0,0,-90]) connector(w, t, wall);
//translate([depth,0,0]) rotate([0,0,90]) connector(w, t, wall);
//translate([depth,width,0]) rotate([0,0,180]) connector(w, t, wall);
//
//translate([wc,wall,wall]) bar_angle(w, ta, depth - 2 * wc);
//translate([wall,width - wc,wall]) rotate([0,0,-90]) bar_angle(w, ta, width - 2 * wc);
//translate([depth-wc,width-wall ,wall]) rotate([0,0,-180]) bar_angle(w, ta, depth - 2 * wc);
//translate([depth -wall,wc ,wall]) rotate([0,0,90]) bar_angle(w, ta, width - 2 * wc);