/// @description Insert description here
// You can write your code in this editor

global.changes = false;
global.focus = 0; //0 = buttons and timeline; 1 = exit menu; 2 = export menu;

load_project();

if (array_length(variable_struct_get_names(global.props_menu)) == 0) {
	instance_destroy(obj_properties);
}

//play music
play_music();

//seleccion de notas
global.nSelected = {
	x : -1,
	y : -1
}
