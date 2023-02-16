function DisplayError(msg){
	instance_create_layer(mouse_x,mouse_y,"Floating_Text",obj_floatingText,{
		text : msg
	})
}