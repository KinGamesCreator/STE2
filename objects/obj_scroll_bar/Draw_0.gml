/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_self(); //dibujar barra

//dibujar mini-player
var pos_x_player_scroll = p_size * (time_music() / length_music());
pos_x_player_scroll /= (p_size / room_width);
draw_sprite_ext(spr_line,0,pos_x_player_scroll,y,1,1,0,c_red,1);

