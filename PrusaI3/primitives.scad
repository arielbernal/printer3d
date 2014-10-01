module triangular_prism_rect(b, h, l, c = false) {
  linear_extrude(height = l, center = c, convexity = 10, twist = 0)
  polygon(points=[[0,0],[b,0],[0,h]], paths=[[0,1,2]]);
}

module triangular_prism(b, h, l, c = false) {
  linear_extrude(height = l, center = c, convexity = 10, twist = 0)
  polygon(points=[[-b/2,0],[b/2,0],[0,h]], paths=[[0,1,2]]);
}
translate([0,15,0]) triangular_prism(4,2,40);