/// @description Insert description here
// You can write your code in this editor

draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_set_font(font_projects_menu);

if (selection) {
	
	draw_set_color(c_white);
	
	draw_text(display_get_gui_width()/2,(-1 - selected2) * 50 + display_get_gui_height()/2,"Sure to delete " + options[selected].name + ".STE?");
	
	var txts = ["No.","Yes."];
	for (var i = 0; i < array_length(txts); i++) {
		var y_pos = (i - selected2) * 50 + display_get_gui_height()/2;
		if (selected2 == i) {
			draw_set_color(c_orange); txts[i] = "> " + txts[i] + " <";
		} else draw_set_color(c_white);
		draw_text(display_get_gui_width()/2,y_pos,txts[i]);
	}
	
} else {
	for (var i = 0; i < array_length(options); i++) {
		
		var y_pos = (i - selected) * 50 + display_get_gui_height()/2;
		var t_draw = options[i].name;
		if (i < array_length(options)-1) t_draw += ".STE2";
		
		if (selected == i) {
			draw_set_color(c_orange); t_draw = "> " + t_draw + " <";
		} else draw_set_color(c_white);
		
		draw_text(display_get_gui_width()/2,y_pos,t_draw);
		
	}
}
