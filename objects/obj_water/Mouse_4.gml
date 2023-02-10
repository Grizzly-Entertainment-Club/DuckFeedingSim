/// @description Interact

//If close enough fill bucket.
if (distance_to_object(obj_player) < 10) {
	obj_player.bucketFilled = true;
} else {
	DisplayError("Too far away!");
}