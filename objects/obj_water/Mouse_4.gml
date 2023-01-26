/// @description Interact
if (distance_to_object(obj_player) < 10) {
	obj_player.bucket_filled = true;
} else {
	displayError("Too far away!");
}