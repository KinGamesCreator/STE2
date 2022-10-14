/// @description Insert description here
// You can write your code in this editor

dif = display_get_gui_width() / room_width; //diferencia de draw gui con la room.

//crear y fijar surface
if !surface_exists(surface_props) surface_props = surface_create(sprite_width * dif, (sprite_height-1)*dif);
surface_set_target(surface_props);
draw_clear_alpha(c_white,0);

//font properties
draw_set_font(font_properties);

#region no note selected

if (global.nSelected.x = -1) {
	draw_set_valign(fa_middle); draw_set_halign(fa_center);draw_set_color(c_black);
	draw_text((sprite_width/2)*dif,(sprite_height/2)*dif,"[no note selected]");
	surface_reset_target();draw_set_alpha(1);draw_set_color(c_white);
	draw_surface(surface_props,x*dif,(y+1)*dif);
	exit;
}

#endregion

//actual draw position.
var act_pos = -list_y;

//propiedades de la nota seleccionada.
var note_props = variable_struct_get_names(global.project.notes[global.nSelected.y][global.nSelected.x].props);

for (var i = 0; i < array_length(note_props); i++) {
	
	draw_set_alpha(1); draw_set_color(c_black);
	var value = get_note_prop(global.nSelected.y,global.nSelected.x,note_props[i]);
	var prop_info = variable_struct_get(global.props_menu,note_props[i]);
	
	//draw properties
	switch(prop_info._type) {
		case "bool":
			#region boolean
			var spr = 0;
			if (!value) spr = 0; else spr = 5;
			draw_sprite_ext(spr_props_options,spr,dif,act_pos*dif,dif,dif,0,c_white,1);
			draw_set_valign(fa_middle); draw_set_halign(fa_center);draw_set_color(c_black);
			
			draw_text(20*dif,(act_pos+4)*dif,note_props[i]);
			
			if global.focus == 0 && (point_in_rectangle(mouse_x,mouse_y,x+41,y+act_pos+2,x+47,y+act_pos+8)) {
				draw_set_alpha(0.2); draw_set_color(c_white);
				draw_rectangle(dif*(41),dif*(act_pos+2),dif*(47),dif*(act_pos+7),0);
			}
			
			act_pos += 7;
			#endregion
		break;
		case "count":
			#region number
			draw_sprite_ext(spr_props_options,1,dif,act_pos*dif,dif,dif,0,c_white,1);
			draw_set_valign(fa_middle); draw_set_halign(fa_center);draw_set_color(c_black);
			
			draw_text(17*dif,(act_pos+4)*dif,note_props[i] + ": " + string(value));
			
			if global.focus == 0 && (point_in_rectangle(mouse_x,mouse_y,x+41,y+act_pos+2,x+47,y+act_pos+8)) {
				draw_set_alpha(0.2); draw_set_color(c_white);
				draw_rectangle(dif*(41),dif*(act_pos+2),dif*(47),dif*(act_pos+7),0);
			}
			
			if global.focus == 0 && (point_in_rectangle(mouse_x,mouse_y,x+34,y+act_pos+2,x+39,y+act_pos+8)) {
				draw_set_alpha(0.2); draw_set_color(c_white);
				draw_rectangle(dif*(34),dif*(act_pos+2),dif*(39),dif*(act_pos+7),0);
			}
			
			act_pos += 7;
			#endregion
		break;
		case "slider":
			#region slider
			draw_sprite_ext(spr_props_options,2,dif,act_pos*dif,dif,dif,0,c_white,1);
			draw_set_valign(fa_middle); draw_set_halign(fa_center);draw_set_color(c_black);
			draw_text(24*dif,(act_pos+3)*dif,note_props[i] + ": " + string(value));
			
			var posx = (value - prop_info._min)/(prop_info._max - prop_info._min);
			
			draw_sprite_ext(spr_props_options,4,merge_values(3*dif,42*dif,posx),(act_pos+7)*dif,dif,dif,0,c_white,1);
			
			if global.focus == 0 && (point_in_rectangle(mouse_x,mouse_y,x+merge_values(3,42,posx),y+act_pos+8,x+merge_values(7,46,posx),y+(act_pos+12))) {
				draw_set_alpha(0.2); draw_set_color(c_white);
				draw_rectangle(merge_values(3*dif,42*dif,posx),(act_pos+7)*dif,merge_values(7*dif,46*dif,posx),(act_pos+11)*dif,0);
			}
			
			act_pos += 12;
			#endregion
		break;
		case "choose":
			#region choose
			draw_sprite_ext(spr_props_options,3,dif,act_pos*dif,dif,dif,0,c_white,1);
			draw_set_valign(fa_middle); draw_set_halign(fa_center);draw_set_color(c_black);
			draw_text(24*dif,(act_pos+4)*dif,note_props[i] + ": \"" + string(value) + "\"");
			
			if global.focus == 0 && (point_in_rectangle(mouse_x,mouse_y,x+2,y+act_pos+2,x+47,y+act_pos+8)) {
				draw_set_alpha(0.2); draw_set_color(c_white);
				draw_rectangle(dif*2,dif*(act_pos+1),dif*46,dif*(act_pos+7),0);
			}
			
			act_pos += 7;
			#endregion
		break;
	}
	
}

//draw surface
surface_reset_target();
draw_set_alpha(1);
draw_set_color(c_white);

draw_surface(surface_props,x*dif,(y+1)*dif);

