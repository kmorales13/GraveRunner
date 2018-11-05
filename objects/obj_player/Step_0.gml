var bbox_side;

UP = keyboard_check(ord("W"));
DOWN = keyboard_check(ord("S"));
LEFT = keyboard_check(ord("A"));
RIGHT = keyboard_check(ord("D"));

hsp = (RIGHT - LEFT) * spd;
vsp = (DOWN - UP) * spd;

bbox_side = hsp > 0 ? bbox_right : bbox_left;
if (tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_top) != 0 || 
    tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_bottom) != 0) {
	hsp = 0;				
}

bbox_side = vsp > 0 ? bbox_bottom : bbox_top;
if (tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + vsp) != 0 || 
    tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + vsp) != 0) {
	vsp = 0;				
}

x += hsp;
y += vsp;