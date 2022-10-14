/// @description Insert description here
// You can write your code in this editor

if (!selection) {
	selected += (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down));
	selected -= (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up));

	if (selected < 0) selected++;
	if (selected >= array_length(options)) selected--;

	if keyboard_check_pressed(vk_enter) {
		if (selected != (array_length(options)-1)) {
			selection = true;
		} else options[selected].func();
	}//options[selected].func();
} else {
	selected2 += (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down));
	selected2 -= (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up));
	if (selected2 < 0) selected2++;
	if (selected2 >= 2) selected2--;
	
	if !keyboard_check_pressed(vk_enter) exit;
	
	if (selected2 == 0) selection = false;
	if (selected2 == 1) options[selected].func();
	
}
