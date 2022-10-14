/// @description Insert description here
// You can write your code in this editor

selected += (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down));
selected -= (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up));

if (selected < 0) selected++;
if (selected >= array_length(options)) selected--;

options[selected].func();

/*if (anim_selected != selected) {
	var _sign = sign(selected - anim_selected);
	anim_selected += 0.1*_sign;
	if (sign(selected - anim_selected) != _sign) anim_selected = selected;
}*/
