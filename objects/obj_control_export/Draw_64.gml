/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),0);

draw_set_alpha(1);
draw_set_font(font_export);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

if keyboard_check_pressed(vk_enter) {
	draw_set_color(c_white);
	draw_text(display_get_gui_width()/2,display_get_gui_height()/2,"Exporting...");
	exit;
}

for (i = 0; i < array_length(modules); i++) {
	
	var t_draw = modules[i].name;
	
	if (selected == i) {
		draw_set_color(c_yellow);
		t_draw = "> " + t_draw + " <";
	} else draw_set_color(c_white);
	
	draw_text(display_get_gui_width()/2,display_get_gui_height()/2 + (i-selected)*50,t_draw);
}
