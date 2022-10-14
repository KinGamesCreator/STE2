// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function new_project (bpm,npb,lines) {
	var notes_size = floor(length_music()*(bpm/60)*npb)+1;
	global.project = { bpm:bpm, npb:npb, notes:[]}
	for (var i = 0; i < lines; i++) {
		global.project.notes[i] = [];
		for (var k = 0; k < notes_size; k++) { global.project.notes[i][k] = noone; }
	}
}

function note_set_size(line,row,size) {
	var _nota = global.project.notes[line][row];
	for (var i = row+1; i <= row+_nota.duration; i++) { global.project.notes[line][i] = noone; }
	_nota.duration = size;
	for (var i = row+1; i <= row+size; i++) {
		if (is_struct(global.project.notes[line][i])) { del_note(line,i); }
		global.project.notes[line][i] = (row+size)-i+1;
	}
}

function set_default_properties(data) {
	global.default_props = data;
}

function note_change_size(line,row,change) {
	var _nota = global.project.notes[line][row];
	for (var i = row+1; i <= row+_nota.duration; i++) {
		global.project.notes[line][i] = noone;
	} _nota.duration += change;
	for (var i = row+1; i <= row+size; i++) {
		if is_struct(global.project.notes[line][i]) {
			del_note(line,i);
		} global.project.notes[line][i] = abs(row-i);
	}
}

function note_exists(line,row) {
	if (global.project.notes[line][row] == noone || !is_struct(global.project.notes[line][row])) return false;
	return true;
}

function new_line () {
	var notes_size = array_length(global.project.notes[0]);
	array_push(global.project.notes,[]);
	for (var i = 0; i < notes_size; i++) {
		global.project.notes[array_length(global.project.notes)-1][i] = noone;
	}
}

function set_note (line,row) {
	
	var _props = {};
	var names = variable_struct_get_names(global.default_props);
	for (var i = 0; i < array_length(names); i++) {
		var aux = variable_struct_get(global.default_props,names[i]);
		variable_struct_set(_props,names[i],aux);
	}
	
	global.project.notes[line][row] = {
		props: _props,
		duration : 0
	};
}

function del_note (line,row) {
	for (var i = row+1; i <= row+global.project.notes[line][row].duration; i++) {
		global.project.notes[line][i] = noone;
	} global.project.notes[line][row] = noone;
}

function get_note_prop (line,row,prop_name) {
	return variable_struct_get(global.project.notes[line][row].props,prop_name);
}

function set_note_prop (line,row,prop_name,value) {
	variable_struct_set(global.project.notes[line][row].props,prop_name,value);
}

function del_line (line) {
	for (var i = line; i < array_length(global.project.notes); i++) {
		if (i == array_length(global.project.notes)-1) {
			array_resize(global.project.notes,i); break;
		}
		global.project.notes[i] = global.project.notes[i+1];
	}
}
