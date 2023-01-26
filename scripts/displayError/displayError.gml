// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function displayError(msg){
	instance_create_layer(mouse_x,mouse_y,"Floating_Text",obj_floatingText,{
		text : msg
	})
}