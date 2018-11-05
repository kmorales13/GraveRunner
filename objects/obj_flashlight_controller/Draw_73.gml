if (surface_exists(surf)) {
	shader_set(shd_shadows);
	shader_set_uniform_f(LightPosRadius, lx, ly, rad, 0);

	draw_surface(surf, 0, 0);

	shader_reset();
}