seperation = 45; // Rod seperation
diameter = 8.3;  // Rod diameter
height = 70; // Height of object
caliper_width = 16.3;  // Width of caliper shaft
tool_width = caliper_width+4;
caliper_thickness = 4.3; // Thickness of caliper shaft
minimum_belt_distance = 5;
mount_width=4;
center=height/2;
rotate_body=1; // Rotate the body for easier tool removal

module body() {
	difference() {
		cube([height,diameter+mount_width,tool_width]);
		translate([center-seperation/2, diameter/2+mount_width/2, 0])
			cylinder(h=tool_width, r=diameter/2);
		translate([center-seperation/2-diameter/2, 0 ,0])
		cube([diameter,diameter/2+mount_width/2,tool_width]);

		translate([center+seperation/2, diameter/2+mount_width/2, 0])
			cylinder(h=tool_width, r=diameter/2);
		translate([center+seperation/2,mount_width/2,0])
			cube([height-center+seperation/2,diameter,tool_width]);

		translate([center-seperation/2+diameter/2+minimum_belt_distance,0,0])
			cube([seperation/2+diameter/2,diameter+0.3,tool_width]);
	}
}

module caliper_mount() {
	difference() {
		cube([height-center+seperation/2-diameter/2-10,10,tool_width]);
		translate([4,5-caliper_thickness/2,2])
			cube([height-center+seperation/2-diameter/2-10-4,caliper_thickness,caliper_width]);
		translate([0,5-caliper_thickness/2,4])
			cube([4,caliper_thickness,caliper_width-4]);
	}
}

difference() {
	union() {
		if (rotate_body == 1) {
			translate([height,0,tool_width])
				rotate([0,180,0])
					body();
		} else {
		body();
		}
		translate([0,mount_width+diameter,0])
			caliper_mount();
	}
}