/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

image_xscale = (room_width/(p_size/obj_panel.sprite_width))/6;

if (global.focus != 0) exit;

var mouse_rx = window_mouse_get_x()*(room_width/window_get_width()); //mouse real X position

if mouse_check_button_pressed(mb_left) and collision_point(mouse_x,mouse_y,id,1,0) {
	pos_ant.x1 = x;
	pos_ant.x2 = mouse_rx;
	pressed = true;
}

if (pressed) {
	if mouse_check_button_released(mb_left) or (global.focus != 0) pressed = false;
	
	x = pos_ant.x1 + (mouse_rx - pos_ant.x2);
	if (x < 0) x = 0;
	if (x > (room_width - sprite_width)) x = (room_width - sprite_width);
	obj_panel.position.x = round(x * (p_size / room_width))
	
} else {
	x = abs(obj_panel.position.x) / (p_size / room_width);
}

y = room_height - 6;
