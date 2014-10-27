WALL = 2;
PSU_CLEARANCE = 2;
PSU_WIDTH = 115 + PSU_CLEARANCE;
PSU_HEIGHT = 50 + PSU_CLEARANCE;
PSU_DEPTH = 200;

COVER_WIDTH = PSU_WIDTH + (2 * WALL);
COVER_HEIGHT = PSU_HEIGHT + (2 * WALL);
COVER_DEPTH = 60 + WALL;
COVER_INNER_DEPTH= 45 + WALL;
COVER_SUPPORT_WIDTH = 20;

VENT_HEIGHT = 45;
VENT_WIDTH = 5;
VENT_DISTANCE = 15;

CABLE_SLOT_WIDTH = 8;
CABLE_SLOT_HEIGHT = 18;
CABLE_SLOT_Y_OFFSET = 40;
CABLE_SLOT_VENT_DISTANCE = 2;

POWER_SOCKET_OFFSET = 13;
POWER_SWITCH_OFFSET = 20;

SCREW_HOLE_HEIGHT = 12;
SCREW_HOLE_WIDTH = 5;
SCREW_HOLE_Z_OFFSET = 12.5;
SCREW_HOLE_Y_OFFSET = 45.5;


module cover() {
  difference() 
{
    cube([COVER_WIDTH, COVER_DEPTH, COVER_HEIGHT]);
    translate([COVER_SUPPORT_WIDTH, COVER_INNER_DEPTH-1, -1]) {
      cube([COVER_WIDTH - (2 * COVER_SUPPORT_WIDTH), COVER_DEPTH - COVER_INNER_DEPTH+2, COVER_HEIGHT+2]);
    }
    translate([WALL, WALL, WALL]) {
      cube([PSU_WIDTH, PSU_DEPTH, PSU_HEIGHT]);
    }
  }
}

module vents() {
  for (x = [ WALL + VENT_DISTANCE : VENT_DISTANCE : COVER_WIDTH - WALL ]) {
    translate([x, WALL, (COVER_HEIGHT - VENT_HEIGHT) / 2]) {
      rotate([0, -90, 90]) {
        if (x < CABLE_SLOT_HEIGHT + WALL + VENT_DISTANCE) {
          translate([CABLE_SLOT_WIDTH + CABLE_SLOT_VENT_DISTANCE, 0, 0]) {         
            slot(VENT_WIDTH, VENT_HEIGHT - CABLE_SLOT_WIDTH - CABLE_SLOT_VENT_DISTANCE, 2 * WALL);
          }
        } else {
          slot(VENT_WIDTH, VENT_HEIGHT, 2 * WALL);
        }
      }
    }
  }

}

module slot(width, height, depth) {
  translate([width / 2, 0, -.1]) {
    union() {
      cube([height - width, width, depth]);
      translate([0, width / 2, 0]) {
        cylinder(h = depth, r = width / 2);
      }
      translate([height - width, width / 2, 0]) {
        cylinder(h = depth, r = width / 2);
      }
    }
  }
}

module powerSocket() {
  translate([WALL + 2 + COVER_WIDTH, POWER_SOCKET_OFFSET, 0.5 * COVER_HEIGHT]) {
    rotate([0, 90, 0]) {
      translate([20,0,-5]) cylinder(r=1.7, h=22, center=true);
      translate([-20,0,-5]) cylinder(r=1.7, h=22, center=true);
      hull() {
        minkowski() {
          cube([20.5,12.5,3], center=true);
          cylinder(r=5,h=0.1);
        }
        translate([20,0,0]) cylinder(r=5, h=3, center=true);
        translate([-20,0,0]) cylinder(r=5, h=3, center=true);
      }
      translate([0,0,-5.5 - 1.5])
        minkowski() {
          cube([20,12,11], center=true);
          cylinder(r=4,h=0.1);
      }
    }
  }
}

module powerSwitch() {
  translate([COVER_WIDTH / 2, POWER_SWITCH_OFFSET, COVER_HEIGHT + 2]) {
    rotate([0, 0, -90]) {
	  cube([14.8,20.8,2], center=true);
	  translate([0,0,-7-1]) cube([13,19.8,14], center=true);
    }
  }
}

module cableSlot() {
  translate([WALL + VENT_DISTANCE / 2, WALL, (COVER_HEIGHT - VENT_HEIGHT) / 2]) {
    rotate([90, 0, 0]) {
      slot(CABLE_SLOT_WIDTH, CABLE_SLOT_HEIGHT, WALL * 2);
    }
  }
}

module screwHoles() {
  translate([-2.5, SCREW_HOLE_Y_OFFSET + WALL - SCREW_HOLE_HEIGHT, SCREW_HOLE_Z_OFFSET + WALL + PSU_CLEARANCE / 2 - SCREW_HOLE_WIDTH / 2]) {
    rotate([90, 0, 90]) {
      slot(SCREW_HOLE_WIDTH, SCREW_HOLE_HEIGHT, COVER_WIDTH + 5);
    }
  }

  translate([-2.5, SCREW_HOLE_Y_OFFSET + WALL - SCREW_HOLE_HEIGHT, COVER_HEIGHT - SCREW_HOLE_Z_OFFSET - SCREW_HOLE_WIDTH - WALL - PSU_CLEARANCE / 2 + SCREW_HOLE_WIDTH / 2]) {
    rotate([90, 0, 90]) {
      slot(SCREW_HOLE_WIDTH, SCREW_HOLE_HEIGHT, COVER_WIDTH + 5);
    }
  }
}

translate([0, COVER_HEIGHT, 0]) rotate([90, 0, 0]) {
  difference() {
    cover();
    vents();
    cableSlot();
    powerSocket();
//    powerSwitch();
//    screwHoles();
  }
}

