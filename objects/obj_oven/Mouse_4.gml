/// @description Interact

//See if Player is in range.
if (distance_to_object(obj_player) < 20) {
	//Grab Bread from Oven
	if has_bread == true{
		obj_player.bread+=10;
		has_bread = false;
	}
	//Add Flour to Oven
	else if !has_flour && obj_player.flour >=1{
		has_flour = true;
		obj_player.flour--;
	}
	//Add Water to Oven
	else if !has_water && obj_player.bucket_filled {
		has_water = true;
		obj_player.bucket_filled = false;
	}
	//Combine Water and Flour and Make Bread
	if has_flour && has_water{
		has_flour = false;
		has_water = false;
		has_bread = true;
	}
} else {
	displayError("Too Far Away!");
}