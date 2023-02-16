switch(state) {
	
	//Truck is sitting on screen, waiting.
	case TRUCK_STATE.WAITING:
		image_speed = 0;
	break;
	
	//Truck is leaving the Bread Factory
	case TRUCK_STATE.LEAVING:
		image_speed = 0.5;
		x -= truckSpeed;
		if (x <= -200) {
			x = -200;
			state = TRUCK_STATE.AT_STORE;
		}
	break;
	
	//Truck is at the store, buying and selling materials.
	case TRUCK_STATE.AT_STORE:
		//Sell Inventory, Stock up on Items.
		obj_controller.money += cargoValue;
		cargoValue = 0;
		state = TRUCK_STATE.RETURNING;
	break;
	
	//Truck is on the way back to the Bread Factory.
	case TRUCK_STATE.RETURNING:
		x += truckSpeed/2;
		if (x >= xstart) {
			state = TRUCK_STATE.WAITING;
		}
	break;
	
}