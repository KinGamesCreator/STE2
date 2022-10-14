// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#region examples
/*
{
	boolean	: {
		_type	: "bool",
		_default: false
	},
	count	: {
		_type	: "count",
		_default: 0,
		_in		: 1,
		_min	: 0,
		_max	: 10
	},
	slider	: {
		_type	: "slider",
		_default: 1,
		_min	: 1,
		_max	: 2
	},
	text	: {
		_type	: "choose",
		_default: 0,
		_options	: ["hello","bye","no","yes"]
	}
}
*/
#endregion

function get_templates() {

	var _file = file_text_open_read(program_directory + "data/templates.json");
	var _json = "";
	
	while (!file_text_eof(_file)) {
	    _json += file_text_readln(_file);
	}
	
	return(json_parse(_json));
	
}


