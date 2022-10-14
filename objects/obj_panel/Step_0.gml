/// @description Insert description here
// You can write your code in this editor

if (global.focus != 0) exit;

var interactions = point_in_rectangle(mouse_x,mouse_y,x,y+6,x+sprite_width,y+sprite_height);

//fijar posición de la música.
if point_in_rectangle(mouse_x,mouse_y,x,y,sprite_width,y+5) && mouse_check_button_pressed(mb_left) {
	set_time_music(((mouse_x+position.x)/(second_scale * length_music())) * length_music());
}

#region movimiento
if interactions && mouse_check_button_pressed(mb_middle) && !keyboard_check(vk_control) {
	action = "movement";
	movement.x1 = mouse_x;
	movement.y1 = mouse_y;
	movement.x2 = position.x;
	movement.y2 = position.y;
}

if action = "movement" {
	position.x = movement.x2 + movement.x1 - mouse_x;
	position.y = movement.y2 + mouse_y - movement.y1;
	
	//limites horizontales
	if (position.x < 0) { position.x = 0; movement.x1 = mouse_x; movement.x2 = position.x; }
	if (position.x > array_length(global.project.notes[0])*6 - sprite_width) {
		position.x = array_length(global.project.notes[0])*6 - sprite_width;
		movement.x1 = mouse_x; movement.x2 = position.x;
	}
	
	//limites verticales
	if (position.y > 0) { position.y = 0; movement.y1 = mouse_y; movement.y2 = position.y;}
	
	if (array_length(global.project.notes)*6+6 > sprite_height) {
		limit = sprite_height - (array_length(global.project.notes)*6+6);
	} else {
		limit = 0;
	}
	if (position.y < limit) {
		position.y = limit;
		movement.y1 = mouse_y; movement.y2 = position.y;
	}
	
	if (mouse_check_button_released(mb_middle) || keyboard_check(vk_control)) action = "none";
}
#endregion

#region estirar

if (action == "length") {
	
	if (!interactions || mouse_check_button_released(mb_left) || keyboard_check(vk_control)) action = "none";
	var nX = floor((position.x+mouse_x-x)/6);
	var newSize = nX - global.nSelected.x;
	if (newSize < 0) newSize = 0;
	note_set_size(global.nSelected.y,global.nSelected.x,newSize);
	
}

#endregion

if (!global.lockFiles) && keyboard_check(vk_control) && mouse_check_button_pressed(mb_left) && interactions && array_length(global.project.notes) > 1 {
	global.changes = true;
	var line = floor((-position.y+mouse_y-y-6)/6);
	del_line(line);
	global.nSelected.x = -1; global.nSelected.y = -1;
}

//colocar, seleccionar y quitar notas.
if interactions && (action == "none") && !keyboard_check(vk_control) {
	
	if mouse_check_button_pressed(mb_left) {
		
		global.changes = true;
		
		var note_data = {
			x : floor((position.x+mouse_x-x)/6),
			y : floor((-position.y+mouse_y-y-6)/6)
		}
		
		if (note_data.x < 0 || note_data.x >= array_length(global.project.notes[0])) exit;
		if (note_data.y < 0 || note_data.y >= array_length(global.project.notes)) exit;
		
		if global.project.notes[note_data.y][note_data.x] == noone || !is_real(global.project.notes[note_data.y][note_data.x]) {
			
			if global.project.notes[note_data.y][note_data.x] == noone {
				set_note(note_data.y,note_data.x);
			}
			
			global.nSelected.x = note_data.x;
			global.nSelected.y = note_data.y;
			
			action = "length";
			
		}
	
	}
	
	if mouse_check_button_pressed(mb_right) {
		
		global.changes = true;
		
		var note_data = {
			x : floor((position.x+mouse_x-x)/6),
			y : floor((-position.y+mouse_y-y-6)/6)
		}
		
		if (note_data.x < 0 || note_data.x >= array_length(global.project.notes[0])) exit;
		if (note_data.y < 0 || note_data.y >= array_length(global.project.notes)) exit;
		
		if note_exists(note_data.y,note_data.x) {
			del_note(note_data.y,note_data.x);
		}
		
		global.nSelected.x = -1;
		global.nSelected.y = -1;
		
	}
	
}

