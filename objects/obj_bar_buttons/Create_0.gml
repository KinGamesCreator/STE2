/// @description Insert description here
// You can write your code in this editor

#region functions

function add_button (sprNum = 0,onClick,focus = 0) {
	array_push(obj_bar_buttons.buttons,{
		spr		: sprNum,
		onClick	: onClick,
		focus	: focus
	});
}

#endregion

buttons = [];

// Pause/Resume button
add_button(1,function() {
	if status_music() {
		pause_music();
	} else resume_music();
	buttons[0].spr = real(status_music());
},0);

// Restart button
add_button(2,function() {
	set_time_music(0);
},0);

// Save button
add_button(3,function() {
	global.changes = false;
	var _save = file_text_open_write(working_directory + "projects/" + global.load + "/data.json");
	file_text_write_string(_save,json_stringify(global.project));
	file_text_close(_save);
},0);

//Export button
add_button(4,function() {
	instance_create_depth(0,0,-100,obj_control_export);
},1);

//New line button
if (!global.lockFiles) {
	add_button(7,function() {
		global.changes = true;
		new_line();
	},0);
}

//home button
add_button(11,function() {
	if (global.changes) {
		var _question = show_question("Do you want to save before going to the menu?");
		if _question {
			var _save = file_text_open_write(working_directory + "projects/" + global.load + "/data.json");
			file_text_write_string(_save,json_stringify(global.project));
			file_text_close(_save);
		}
	}
	game_restart();
},0);

//KinGamesButton
add_button(10,function() {
	url_open("https://kingamescreator.itch.io/");
},0);

