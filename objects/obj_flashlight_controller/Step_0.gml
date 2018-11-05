lx = obj_player.x + 8;
ly = obj_player.y + 8;

if (surface_exists(surf)) {
	var startx = floor((lx - rad) / tile_size);
	var endx = floor((lx + rad) / tile_size);
	var starty = floor((ly - rad) / tile_size);
	var endy = floor((ly + rad) / tile_size);
	
	surface_set_target(surf);
	
	draw_set_colour(c_black);
	draw_set_alpha(0.9);
	
	draw_rectangle(0, 0, surf_width, surf_height, false);
	
	//draw_clear_alpha(0, 0);
	
	draw_set_alpha(1);
	gpu_set_blendmode(bm_src_colour);
	
	draw_set_colour(c_white);
	draw_sprite_ext(spr_flashlight_white, 0, lx, ly, 1, 1, 0, c_yellow, 1);
	
	gpu_set_blendmode(bm_normal);

	vertex_begin(VBuffer, VertexFormat);

	for (var yy = starty; yy <= endy; yy++) {
	    for (var xx = startx; xx <= endx; xx++) {
	        var tile = tilemap_get(tilemap, xx, yy);
	        if (tile != 0) {
				var px1 = xx*tile_size;
	            var py1 = yy*tile_size;
	            var px2 = px1+tile_size;
	            var py2 = py1+tile_size;

	            if(!SignTest(px1, py1, px2, py1, lx, ly))
					ProjectShadow(VBuffer, px1, py1, px2, py1, lx, ly);
			    if(!SignTest(px2, py1, px2,py2, lx,ly))
			        ProjectShadow(VBuffer, px2, py1, px2, py2, lx, ly);
			    if(!SignTest(px2, py2, px1, py2, lx,ly))
			        ProjectShadow(VBuffer, px2, py2, px1, py2, lx, ly);
			    if(!SignTest(px1, py2, px1, py1, lx,ly))
			        ProjectShadow(VBuffer, px1, py2, px1, py1, lx, ly);      
	        }
	    }
	}
	vertex_end(VBuffer);    
	vertex_submit(VBuffer, pr_trianglelist, -1);

	surface_reset_target();
} else {
	surf = surface_create(surf_width, surf_height);
	surface_set_target(surf);
	
	draw_clear_alpha(c_black, 0);
	
	surface_reset_target();
}