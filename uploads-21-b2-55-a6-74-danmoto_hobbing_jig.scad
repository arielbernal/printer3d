//Parameters
bolt_bearing_diameter = 22.0;
bolt_bearing_thickness = 7.0;
bolt_diameter = 8.0;
bolt_offset = 22.0;
bolt_wall = 2.0;
bolt_drill_tolerance = 0.4;
tap_diameter = 6.0;
tap_offset = 18.0;
tap_bearing_diameter = 19.0;
tap_bearing_thickness = 12.0;
tap_wall = 4.0;
tap_drill_tolerance = 0.4;
cut_depth = 0.7;
bridge_thickness = 1.5;

//helper variables
render_error = 1;
tap_extra_length = (bolt_bearing_diameter/2)+tap_wall;
box_total_length = tap_offset+tap_extra_length+tap_bearing_thickness;
box_total_width = ((bolt_bearing_diameter+bolt_diameter+tap_diameter+tap_bearing_diameter)/2)+(bolt_wall*2);
box_total_height = bolt_offset+bolt_bearing_thickness+tap_diameter;

difference()
{
	//chasis
	cube([box_total_length,box_total_width,box_total_height]);

	union()
	{
		//bolt
		translate([tap_bearing_thickness+tap_offset,((bolt_diameter+tap_diameter+tap_bearing_diameter)/2)+bolt_wall,-render_error])
		union()
		{
			//bolt bearing top
			translate([0,0,render_error+bolt_offset+tap_diameter])
				cylinder(r=bolt_bearing_diameter/2,h=bolt_bearing_thickness+render_error);
		
			//bolt hole guide
			translate([0,0,render_error+bolt_bearing_thickness+(tap_diameter*1.5)+bridge_thickness+bridge_thickness])
				cylinder(r=(bolt_diameter+bolt_drill_tolerance)/2,h=bolt_offset-bolt_bearing_thickness-bridge_thickness);
		
			//bolt bearing bottom
			cylinder(r=bolt_bearing_diameter/2,h=bolt_bearing_thickness+render_error);
			
			//bolt hole guide bottom
			translate([0,0,bolt_bearing_thickness+bridge_thickness+render_error])
				cylinder(r=(bolt_diameter+bolt_drill_tolerance)/2,h=(tap_diameter*1.5)-bridge_thickness);
		
			//bolt cutting window
			translate([-(bolt_bearing_diameter/2),-(bolt_bearing_diameter),render_error+bolt_bearing_thickness+(tap_diameter/2)])
				cube([bolt_bearing_diameter,bolt_bearing_diameter*2,tap_diameter+bridge_thickness]);
		}
	
	
		//tap
		translate([-render_error,(tap_bearing_diameter/2)+bolt_wall+cut_depth,bolt_bearing_thickness+tap_diameter])
		rotate([0,90,0])
		union()
		{
			//tap bearing
//			cylinder(r=tap_bearing_diameter/2,h=tap_bearing_thickness+render_error);
			//tap hole
			cylinder(r=(tap_diameter+tap_drill_tolerance)/2,h=box_total_length+(render_error*2));
		}
	}
	
}
