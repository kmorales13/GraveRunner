if (surface_exists(surf)) {
	var cam = obj_camera;
	var _x = cam.xTo - (surf_width / 2);
	var _y = cam.yTo - (surf_height / 2);
	
	draw_surface(surf, _x, _y);
}