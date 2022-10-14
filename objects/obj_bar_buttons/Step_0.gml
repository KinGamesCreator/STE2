/// @description Insert description here
// You can write your code in this editor

//checkear focus global.
if (global.focus != 0) exit;

//checkear si hay actividad sobre los botones de la barra.
if (!point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width*array_length(buttons),y+sprite_height) || !mouse_check_button_pressed(mb_left)) exit;

//si hay actividad, buscar el botón y accionarlo.
for(var i = 0; i < array_length(buttons); i++) {
	if point_in_rectangle(mouse_x,mouse_y,x+sprite_width*i,y,x+sprite_width*(i+1),y+sprite_height) {
		global.focus = buttons[i].focus; buttons[i].onClick(); break;
	}
}


