if (distance_to_object(obj_player) < 20) {
	obj_player.flour += 5;
} else {
	displayError("Too far away!");
}

state = TRUCK_STATE.LEAVING;