var dif = choose(0.01, -0.01, 0);
glow_size += dif;
glow_size = clamp(glow_size, 0.7, 0.9);

if (surface_exists(surf)) {
	surface_set_target(surf);
	
	draw_set_colour(c_black);
	draw_set_alpha(0.9);
	
	draw_rectangle(0, 0, surf_width, surf_height, false);
	
	draw_set_alpha(1);
	
	/*var cam = obj_camera;
	var _x = cam.xTo - (surf_width / 2);
	var _y = cam.yTo - (surf_height / 2);
	
	var xx = obj_player.x - _x; 
	var yy = obj_player.y - _y;
	
	gpu_set_blendmode(bm_src_colour);
	
	draw_set_colour(c_white);
	draw_sprite_ext(spr_flashlight_white, 0, xx + 8, yy + 8, glow_size, glow_size, 0, c_yellow, 1);
	
	
	with (obj_light_source) {
		var cx = x - _x;
		var cy = y - _y;
		draw_sprite_ext(spr_spotlight_white, 0, cx + 8, cy + 8, glow_size, glow_size, 0, c_yellow, 0.5);
	}*/
	
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
} else {
	surf = surface_create(surf_width, surf_height);
	surface_set_target(surf);
	
	draw_clear_alpha(c_black, 0);
	
	surface_reset_target();
}