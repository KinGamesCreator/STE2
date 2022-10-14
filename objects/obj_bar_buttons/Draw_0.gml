/// @description Insert description here
// You can write your code in this editor

//dibujar iconos de botones.
for(var i = 0; i < array_length(buttons); i++) {
	draw_sprite(spr_buttons,buttons[i].spr,x+12*i,y);
}

//comprobar si hay interacción.
if (!point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width*array_length(buttons),y+sprite_height)) exit;

if global.focus != 0 exit;
//dibujar luces de botones.
for(var i = 0; i < array_length(buttons); i++) {
	if point_in_rectangle(mouse_x,mouse_y,x+sprite_width*i,y,x+sprite_width*(i+1),y+sprite_height) {
		draw_set_alpha(0.1 + 0.1 * mouse_check_button(mb_left));
		draw_rectangle(x+12*i,y,x+12*i+11,y+11,0);
		draw_set_alpha(1);
		break;
	}
}

