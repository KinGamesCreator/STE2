/// @description Insert description here
// You can write your code in this editor

surface_panel = noone;

position = { //desplazamiento en el panel.
	x : 0,
	y : 0
};

second_scale = (global.project.bpm/60)*global.project.npb*6; //valor en pixeles que representa un segundo.

movement = { //variables de movimiento de panel
	x1 : 0,
	y1 : 0,
	x2 : 0,
	y2 : 0
}

action = "none"; //accion que está realizando

//note visualizer
visual = {
	act : 0,
	ant : 0,
	laser : 0
}

