// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function load_music(musics_array) {
	global.musics = musics_array;
}

function play_music() {
	global.playing = [];
	for (var i = 0; i < array_length(global.musics);i++) {
		global.playing[i] = audio_play_sound(global.musics[i],0,0);
	}
}

function pause_music() {
	for (var i = 0; i < array_length(global.playing);i++) {
		if audio_is_playing(global.playing[i]) audio_pause_sound(global.playing[i]);
	}
}

function resume_music() {
	for (var i = 0; i < array_length(global.playing); i++) {
		if (!audio_is_playing(global.playing[i]) && audio_sound_length(global.musics[i]) > time_music()) {
			global.playing[i] = audio_play_sound(global.musics[i],1,0);
			audio_sound_set_track_position(global.playing[i],time_music());
		}
		if audio_is_paused(global.playing[i]) audio_resume_sound(global.playing[i]);
	}
}

function time_music() {
	
	for (var i = 0; i < array_length(global.playing); i++) {
		if audio_is_playing(global.playing[i]) {
			return audio_sound_get_track_position(global.playing[i]);
		}
	} return (-1);
	
}

function length_music() {
	var sizes = 0;
	for (var i = 0; i < array_length(global.musics);i++) {
		sizes = max(sizes,audio_sound_length(global.musics[i]));
	} return sizes;
}

function set_time_music(time) {
	for (var i = 0; i < array_length(global.playing); i++) {
		
		if (!audio_is_playing(global.playing[i])) {
			if (audio_sound_length(global.musics[i]) > time && status_music()) {
				global.playing[i] = audio_play_sound(global.musics[i],1,0);
			} else continue;
		} else if (audio_sound_length(global.playing[i]) < time) {
			audio_stop_sound(global.playing[i]); continue;
		}
		
		audio_sound_set_track_position(global.playing[i],time);
	}
}

function status_music() {
	for (var i = 0; i < array_length(global.playing);i++) {
		if (!audio_is_playing(global.playing[i])) continue;
		if (!audio_is_paused(global.playing[i])) return true;
	} return false;
}

