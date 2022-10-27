//Horizontal Movement
var hmove = keyboard_check(vk_right) - keyboard_check(vk_left);
var hsp = hmove * moveSpeed;
x += hsp;

//Vertical Movement
var vmove = keyboard_check(vk_down) - keyboard_check(vk_up);
var vsp = vmove * moveSpeed;
y += vsp;

//Throw Bread
if (mouse_check_button_pressed(mb_left)) {
	var inst = instance_create_layer(x,y-10,"Instances",obj_bread);
	inst.direction = point_direction(x,y,mouse_x,mouse_y);
}