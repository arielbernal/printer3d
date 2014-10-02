module connector(w, t, wall) {
  wc = w + 2 * wall;
  
//  color("lightblue")
  difference() {
    union() {
      cube([wc,wc,wc]);
      difference() {
        cube([2 * wc,2 * wc, wall + t]);
        difference() {
          translate([wc,wc,-0.1]) cube([wc+0.1,wc+0.1, wall + t+0.2]);
          translate([wc,wc,-0.1]) cylinder(h=wall+t+0.2, r=wc, $fn=64);
         }
      }
      difference() {
        cube([2 * wc, wall + t, 2 * wc]);
        difference() {
          translate([wc,-0.1,wc]) cube([wc+0.1, wall + t + 0.2, wc + 0.1]);
          translate([wc,wall+t+0.2,wc]) rotate([90,0,0]) cylinder(h= wall+t+0.5, r=wc, $fn=64);
         }
      }
      difference() {
        cube([wall + t, 2 * wc, 2 * wc]);
        difference() {
          translate([-0.1,wc, wc]) cube([wall + t + 0.2, wc+0.1, wc + 0.1]);
          translate([-0.2,wc,wc]) rotate([0,90,0]) cylinder(h= wall+t+0.5, r=wc, $fn=64);
        }
      }

      translate([wc,0,0]) cube([wc,wc,wc]);
      translate([0,wc,0]) cube([wc,wc,wc]);
      translate([0,0,wc]) cube([wc,wc,wc]);
    }
    union() {
      translate([wc,wall,wall]) cube([wc+0.1, w, t]);
      translate([wc,wall,wall]) cube([wc+0.1, t, w]);
    }
    union() {
      translate([wall,wc,wall]) cube([w, wc+0.1, t]);
      translate([wall,wc,wall]) cube([t, wc+0.1, w]);
    }
    union() {
      translate([wall,wall,wc]) cube([w, t, wc+0.1]);
      translate([wall,wall,wc]) cube([t, w, wc+0.1]);
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



w = 19;
wall = 2;
wc = w + 2 * wall;
t = 1.27;
ta = 1.26; 
depth = 500;
width = 455.4;
connector(w, t, wall);
translate([0,width,0]) rotate([0,0,-90]) connector(w, t, wall);
translate([depth,0,0]) rotate([0,0,90]) connector(w, t, wall);
translate([depth,width,0]) rotate([0,0,180]) connector(w, t, wall);

translate([wc,wall,wall]) bar_angle(w, ta, depth - 2 * wc);
translate([wall,width - wc,wall]) rotate([0,0,-90]) bar_angle(w, ta, width - 2 * wc);
translate([depth-wc,width-wall ,wall]) rotate([0,0,-180]) bar_angle(w, ta, depth - 2 * wc);
translate([depth -wall,wc ,wall]) rotate([0,0,90]) bar_angle(w, ta, width - 2 * wc);