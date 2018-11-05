vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
VertexFormat = vertex_format_end();

VBuffer = vertex_create_buffer();

surf_width = room_width; //320 + 200;
surf_height = room_height; //180 + 200;
surf = surface_create(surf_width, surf_height);

rad = 64;
tile_size = 16;
tilemap = layer_tilemap_get_id("Collision");

lx = 0;
ly = 0;

LightPosRadius = shader_get_uniform(shd_shadows, "u_fLightPositionRadius");