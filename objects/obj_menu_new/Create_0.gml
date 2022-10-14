/// @description Insert description here
// You can write your code in this editor

options = [];

function add_option (_name, _func) {
	array_push(options,{
		name : _name,
		func : _func
	});
}

function check_paths() {
	for (var i = 0; i < array_length(paths); i++) {
		if (paths[i] == "") return false;
	} return true;
}

//Add options
templates = get_templates();
template_names = variable_struct_get_names(templates);
template = 0;

add_option ("Template: none", function(){
	template -= (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")));
	template += (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")));
	if (template < 0) template++;
	if (template >= array_length(template_names)) template--;
	options[0].name = "Template: " + template_names[template];
});

musics = 1;
musics_ant = 1;

add_option ("Number of musics: 1", function(){
	musics -= (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")));
	musics += (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")));
	if (musics <= 0) musics = 1;
	if (musics > 10) musics = 10;
	options[1].name = "Number of musics: " + string(musics);
	if (musics_ant != musics) {
		paths = array_create(musics,"");
		musics_ant = musics;
	}
});

bpm = 100
add_option ("BPM (Beats per second): 100", function(){
	bpm -= 5*(keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")));
	bpm += 5*(keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")));
	if (bpm <= 9) bpm = 10;
	if (bpm > 500) bpm = 500;
	options[2].name = "BPM (Beats per second): " + string(bpm);
});

npb = 4
add_option ("NPB (Notes per beat): 4", function(){
	npb -= (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")));
	npb += (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")));
	if (npb <= 0) npb = 1;
	if (npb > 15) npb = 15;
	options[3].name = "NPB (Notes per beat): " + string(npb);
});

paths = [""];
add_option ("Select musics", function(){
	if (!keyboard_check_pressed(vk_enter)) return;
	for (var i = 0; i < array_length(paths); i++) {
		var value = get_open_filename("music in ogg format|*.ogg","music.ogg");
		if (value == "" || value == undefined || value == noone) break;
		paths[i] = value;
	}
});

add_option ("Create", function(){
	if (!keyboard_check_pressed(vk_enter)) return;
	
	if (!check_paths()) {
		show_message("No musics selected.");
		return;
	}
	
	var name = get_string("Name for the project:","");
	if (name == "" || name == undefined || name == noone) return show_message("Invalid name");
	
	for (var i = 0; i < array_length(paths); i++) {
		file_copy(paths[i],working_directory+"projects/" + name + "/music"+string(i)+".ogg");
	}
	
	var _creation = file_text_open_write(working_directory+"projects/" + name + "/creation.txt");
	file_text_write_string(_creation,json_stringify({
		bpm		: bpm,
		npb		: npb,
		template: variable_struct_get(templates,template_names[template])
	}));
	
	file_text_close(_creation);
	show_message("Sucefully created");
	game_restart();
	
});

add_option ("Cancel", function(){
	if (!keyboard_check_pressed(vk_enter)) return;
	instance_create_depth(x,y,depth,obj_menu_inic);
	instance_destroy();
});

selected = 0;
//anim_selected = 0;
