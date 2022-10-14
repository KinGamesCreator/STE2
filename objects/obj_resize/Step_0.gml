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
	
	obj_panel.image_yscale = (room_height-18)/sprite_get_height(obj_panel.sprite_index);
	
	with(obj_panel) {
		position.y = 0;
		if (position.x > array_length(global.project.notes[0])*6 - sprite_width) {
			position.x = array_length(global.project.notes[0])*6 - sprite_width;
			movement.x1 = mouse_x; movement.x2 = position.x;
		}
	}
	
	if (instance_exists(obj_properties)) {
		obj_panel.image_xscale = (room_width-48)/sprite_get_width(obj_panel.sprite_index);
		obj_properties.x = obj_panel.x+obj_panel.sprite_width;
		obj_properties.image_yscale = (room_height-18)/sprite_get_height(obj_properties.sprite_index);
	} else {
		obj_panel.image_xscale = room_width/sprite_get_width(obj_panel.sprite_index);
	}
	
}

