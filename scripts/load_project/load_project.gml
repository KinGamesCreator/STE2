// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function load_project() {
	
	#region musics load
	var temp = file_find_first(working_directory + "projects/" + global.load + "/*.ogg",fa_archive);
	var musics = [];
	while(temp != "") {
		array_push(musics,
			audio_create_stream(working_directory + "projects/" + global.load +"/"+ temp)
		); temp = file_find_next();
	}
	load_music(musics);
	#endregion
	
	//creation data
	var _creation = file_text_open_read(working_directory+"projects/" + global.load + "/creation.txt");
	var _creationData = json_parse(file_text_read_string(_creation));
	file_text_close(_creation);
	
	global.lockFiles = _creationData.template.lock_files;
	global.props_menu = _creationData.template.properties;
	global.default_props = {};
	
	
	var _properties = variable_struct_get_names(global.props_menu);
	for (var i = 0; i < array_length(_properties); i++) {
		var _prop = variable_struct_get(global.props_menu,_properties[i]);
		var _default = _prop._default;
		if (_prop._type != "choose") {
			variable_struct_set(global.default_props,_properties[i],_default);
		} else {
			variable_struct_set(global.default_props,_properties[i],_prop._options[_default]);
			_prop._act = _default;
		}
	}
	
	if !file_exists(working_directory+"projects/" + global.load + "/data.json") {
		
		new_project(_creationData.bpm,_creationData.npb,_creationData.template.files);
		
	} else {
		var aux_file = file_text_open_read(working_directory+"projects/" + global.load + "/data.json");
		global.project = json_parse(file_text_read_string(aux_file));
		file_text_close(aux_file);
	}
	
}