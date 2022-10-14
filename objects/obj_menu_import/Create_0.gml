/// @description Insert description here
// You can write your code in this editor

options = [];

function add_option (_name, _func) {
	array_push(options,{
		name : _name,
		func : _func
	});
}

//Add options

add_option ("Create", function(){
	instance_create_depth(x,y,depth,obj_menu_new);
	instance_destroy();
});

add_option ("Load", function(){
	instance_create_depth(x,y,depth,obj_menu_selection);
	instance_destroy();
});

add_option ("Import", function(){
	var load = get_open_filename("STE Project|*.ste","project.ste");
	if (load == "" || load == noone || load == undefined) return;
	var name = string_replace(string_lower(filename_name(load)),".ste","");
	
	if directory_exists(working_directory +"projects/"+ name + "/") {
		var response = show_question("Project \""+name+"\" already exists.\nDo you want to replace it?")
		if !response return;
	}
	
	zip_unzip(load,working_directory+"projects/"+name+"/");
	
	show_message("Successful import");
	
});

add_option ("Delete", function(){
	instance_create_depth(x,y,depth,obj_menu_delete);
	instance_destroy();
});

selected = 0;
//anim_selected = 0;
