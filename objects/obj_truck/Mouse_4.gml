///@description Interact

if (distance_to_object(obj_player) < 20) {
	obj_player.flour += GrabFlour(5);
	if (invFlour <= 0) {
		state = TRUCK_STATE.LEAVING;
	}
} else {
	DisplayError("Too far to grab!");
}