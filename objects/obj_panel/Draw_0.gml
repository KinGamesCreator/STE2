/// @description Insert description here
// You can write your code in this editor

//crear surface si no existe y fijarla.
if (!surface_exists(surface_panel)) surface_panel = surface_create(sprite_width,sprite_height);
surface_set_target(surface_panel);

draw_clear(#0C0C0C);

//dibujar panel
draw_sprite_ext(spr_pista,0,frac(position.x / 48)*-48,6+position.y,sprite_width/48+1,array_length(global.project.notes)/2,0,c_white,1);

//detectar interacciones
var interactions = point_in_rectangle(mouse_x,mouse_y,x,y+6,x+sprite_width,y+sprite_height);

for (var i = 0; i < array_length(global.project.notes); i++) { //recorre filas
	
	for (var k = floor(position.x/6); k < array_length(global.project.notes[i]) && k < floor(position.x/6)+49; k++) { //recorre casillas de la fila
		
		var note = global.project.notes[i][k];
		
		//dibujo de notas
		if note_exists(i,k) { //dibujar nota si hay una.
			if (note.duration > 0) {
				draw_sprite_ext(spr_beat,1,k*6-position.x,6+i*6+position.y,note.duration+1,1,0,c_white,1);
			}
			draw_sprite(spr_beat,0,k*6-position.x,6+i*6+position.y);
		} else if (note != noone) { //dibujar cola de duracion.
			draw_sprite_ext(spr_beat,1,k*6-position.x,6+i*6+position.y,note,1,0,c_white,1);
			k += note-1; continue;
		}
		
		if (global.focus != 0 || action != "none" || (keyboard_check(vk_control) && (!global.lockFiles))) {
			if (note != noone) k += note.duration;
			continue; //continuar si no hay focus.
		}
		
		//posición de la casilla
		var nPosition = {
			x : k*6-position.x,
			y : 6+i*6+position.y
		}
		
		//si la nota actual está seleccionada, iluminar.
		if interactions && point_in_rectangle(mouse_x,mouse_y,nPosition.x+x,nPosition.y+y,nPosition.x+5+x,nPosition.y+5+y) {
			if (mouse_check_button(mb_left)) { draw_set_alpha(0.2) } else draw_set_alpha(0.1);
			draw_set_color(c_white);
			draw_rectangle(nPosition.x,nPosition.y,nPosition.x+5,nPosition.y+5,0);
		}
		
		if (note != noone) k += note.duration;
		
	}
	
}

//selected note
var nPosition = {
	x : global.nSelected.x*6-position.x,
	y : 6+global.nSelected.y*6+position.y
}

draw_set_color(c_white); draw_set_alpha(0.1);
draw_rectangle(nPosition.x,nPosition.y,nPosition.x+5,nPosition.y+5,0);

//visualizer

if visual.laser != 0 visual.laser = 0;

if (status_music()) {
	visual.act = floor(time_music()*(global.project.bpm/60)*global.project.npb);

	for (var i = 0; i < array_length(global.project.notes); i++) {
		var note = global.project.notes[i][visual.act];
	
		if note == noone continue;
		if !is_struct(note) visual.laser = 0.1;
		if is_struct(note) && (visual.act != visual.ant|| note.duration != 0) visual.laser = 0.2 ;
	
		draw_set_alpha(visual.laser);
		draw_rectangle(0,6+i*6+position.y,sprite_width,11+i*6+position.y,0);
	}

	visual.ant = visual.act;
} else visual.act = -1;

if (keyboard_check(vk_control) && interactions && (!global.lockFiles)) {
	var line = floor((-position.y+mouse_y-y-6)/6);
	if (line < array_length(global.project.notes)) {
		draw_set_color(c_red); draw_set_alpha(0.4);
		draw_rectangle(0,6+line*6+position.y,sprite_width,11+line*6+position.y,0);
	}
}

//dibujar barra de tiempo.
draw_sprite_ext(spr_time_bar,0,frac(position.x / 48)*-48,0,sprite_width,1,0,c_white,1);

//dibujar marcador de tiempo.
var pos_line = second_scale*time_music()-position.x;
draw_sprite_ext(spr_player,0,pos_line,0,1,sprite_height/sprite_get_height(spr_player),0,c_white,1);

surface_reset_target();
draw_set_alpha(1);
draw_surface(surface_panel,x,y);

