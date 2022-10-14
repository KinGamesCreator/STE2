/// @description Insert description here
// You can write your code in this editor

selection = false;
selected2 = 0;
selected = 0;
options = [];

function add_option (_name, _func) {
	array_push(options,{
		name : _name,
		func : _func
	});
}

function delete_level() {
	var _name = other.options[other.selected].name;
	directory_destroy(working_directory + "projects/" + _name);
	with(other) {
		instance_create_depth(x,y,depth,obj_menu_inic);
		instance_destroy();
	}
}

function open_level() {
	global.load = other.options[other.selected].name;
	room_goto(room_editor);
}

//Add options

var temp = file_find_first(working_directory + "projects/*",fa_directory);
while(temp != "") {
	add_option(temp,delete_level);
	temp = file_find_next();
}

add_option ("Cancel", function(){
	instance_create_depth(x,y,depth,obj_menu_inic);
	instance_destroy();
});

//anim_selected = 0;
