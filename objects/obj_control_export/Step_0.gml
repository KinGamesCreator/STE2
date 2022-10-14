/// @description Insert description here
// You can write your code in this editor

selected += keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
selected -= keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);

if (selected < 0) selected++;
if (selected >= array_length(modules)) selected--;

if keyboard_check_pressed(vk_enter) {
	alarm[0] = 1;
}
