/// @description Interact

//See if Player is in range.
if (distance_to_object(obj_player) < 20) {
	//Grab Bread from Oven
	if hasBread == true{
		obj_player.bread+=10;
		hasBread = false;
	}
	//Add Flour to Oven
	else if !hasFlour && obj_player.flour >=1{
		hasFlour = true;
		obj_player.flour--;
	}
	//Add Water to Oven
	else if !hasWater && obj_player.bucketFilled {
		hasWater = true;
		obj_player.bucketFilled = false;
	}
	//Combine Water and Flour and Make Bread
	if hasFlour && hasWater{
		hasFlour = false;
		hasWater = false;
		hasBread = true;
	}
} else {
	DisplayError("Too Far Away!");
}