/// @description Insert description here
// You can write your code in this editor

draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_set_font(font_projects_menu);

for (var i = 0; i < array_length(options); i++) {
	
	var y_pos = (i - selected) * 50 + display_get_gui_height()/2;
	var t_draw = options[i].name;
	
	if (selected == i) {
		draw_set_color(c_yellow); t_draw = "> " + t_draw + " <";
	} else draw_set_color(c_white);
	
	draw_text(display_get_gui_width()/2,y_pos,t_draw);
	
}
