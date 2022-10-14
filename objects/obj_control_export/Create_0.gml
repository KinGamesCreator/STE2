/// @description Insert description here
// You can write your code in this editor

modules = get_platforms();
selected = 0;

array_push(modules,{
	name : "Cancel",
	func : function() {global.focus = 0; instance_destroy(other);}
});
