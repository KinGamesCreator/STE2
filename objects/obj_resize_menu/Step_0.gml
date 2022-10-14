/// @description Insert description here
// You can write your code in this editor

if (ww != window_get_width() || wh != window_get_height()) {
	
	ww = window_get_width();
	wh = window_get_height();
	if (ww == 0 || wh == 0) exit;
	room_width = window_get_width()/5;
	room_height = window_get_height()/5;
	
	camera_set_view_size(view_camera[0],room_width,room_height);
	surface_resize(application_surface,room_width*5,room_height*5);
	
	//obj_levels_bar.image_xscale = (room_width-108)/sprite_get_width(obj_levels_bar.sprite_index);
	//obj_levels_bar.image_yscale = room_height / sprite_get_height(obj_levels_bar.sprite_index);
	
}



