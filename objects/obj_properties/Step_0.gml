/// @description Insert description here
// You can write your code in this editor

var interactions = point_in_rectangle(mouse_x,mouse_y,x,y+6,x+sprite_width,y+sprite_height);

if (slidering != -1) {
	
	if (global.focus != 0 || global.nSelected.x = -1) exit;
	
	var note_props = variable_struct_get_names(global.project.notes[global.nSelected.y][global.nSelected.x].props);
	
	if !mouse_check_button(mb_left) { slidering = -1; exit; }
	
	var mouse_rx = window_mouse_get_x()*(room_width/window_get_width()); //mouse real X position
	var pointX = x+4;
	
	var prop_info = variable_struct_get(global.props_menu,note_props[slidering]);
	
	var value = prop_info._min + (mouse_rx - pointX) / 39 * (prop_info._max - prop_info._min);
	
	if (value < prop_info._min) value = prop_info._min;
	if (value > prop_info._max) value = prop_info._max;
	
	set_note_prop(global.nSelected.y,global.nSelected.x,note_props[slidering],value);
	
}

if (global.focus != 0 || global.nSelected.x = -1 || !interactions) exit;

var act_pos = -list_y;
var note_props = variable_struct_get_names(global.project.notes[global.nSelected.y][global.nSelected.x].props);

for (var i = 0; i < array_length(note_props); i++) {
	
	var value = get_note_prop(global.nSelected.y,global.nSelected.x,note_props[i]);
	var prop_info = variable_struct_get(global.props_menu,note_props[i]);
	
	switch(prop_info._type) {
		case "bool":
			if (point_in_rectangle(mouse_x,mouse_y,x+41,y+act_pos+2,x+47,y+act_pos+8) && mouse_check_button_pressed(mb_left)) {
				set_note_prop(global.nSelected.y,global.nSelected.x,note_props[i],!value);
			}
			act_pos += 7;
		break;
		case "count":
			
			if (point_in_rectangle(mouse_x,mouse_y,x+41,y+act_pos+2,x+47,y+act_pos+8) && mouse_check_button_pressed(mb_left)) {
				value += prop_info._in;
				if (value > prop_info._max) value = prop_info._max;
				set_note_prop(global.nSelected.y,global.nSelected.x,note_props[i],value);
			}
			
			if (point_in_rectangle(mouse_x,mouse_y,x+34,y+act_pos+2,x+39,y+act_pos+8) && mouse_check_button_pressed(mb_left)) {
				value -= prop_info._in;
				if (value < prop_info._min) value = prop_info._min;
				set_note_prop(global.nSelected.y,global.nSelected.x,note_props[i],value);
			}
			
			act_pos += 7;
		break;
		case "slider":
			
			var posx = (value - prop_info._min)/(prop_info._max - prop_info._min);
			if (point_in_rectangle(mouse_x,mouse_y,x+merge_values(3,42,posx),y+act_pos+9,x+merge_values(7,46,posx),y+(act_pos+12)) && mouse_check_button_pressed(mb_left)) {
				slidering = i;
				exit;
			}
			
			act_pos += 12;
		break;
		case "choose":
			
			if (point_in_rectangle(mouse_x,mouse_y,x+2,y+act_pos+2,x+47,y+act_pos+8) && mouse_check_button_pressed(mb_left)) {
				prop_info._act++;
				if prop_info._act >= array_length(prop_info._options) prop_info._act = 0;
				
				value = prop_info._options[prop_info._act];
				
				set_note_prop(global.nSelected.y,global.nSelected.x,note_props[i],value);
				
			}
			
			act_pos += 7;
		break;
	}
	
}


