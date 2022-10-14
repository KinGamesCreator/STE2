/// @description Insert description here
// You can write your code in this editor

selected = 0;
options = [];

function add_option (_name, _func) {
	array_push(options,{
		name : _name,
		func : _func
	});
}

function open_level() {
	global.load = other.options[other.selected].name;
	room_goto(room_editor);
}

//Add options

var temp = file_find_first(working_directory + "projects/*",fa_directory);
while(temp != "") {
	add_option(temp,open_level);
	temp = file_find_next();
}

add_option ("Cancel", function(){
	instance_create_depth(x,y,depth,obj_menu_inic);
	instance_destroy();
});

//anim_selected = 0;
