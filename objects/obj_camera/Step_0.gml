x += (xTo - x) / 15;
y += (yTo - y) / 15;

if (follow != noone) {
	if (obj_player.x >= (cw / 2) && obj_player.x <= room_width - (cw / 2))
		xTo = follow.x;
	if (obj_player.y >= (ch / 2) && obj_player.y <= room_height - (ch / 2))
		yTo = follow.y;
}

x = floor(x);
y = floor(y);

var vm = matrix_build_lookat(x, y, -10, x , y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);