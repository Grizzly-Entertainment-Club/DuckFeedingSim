switch(state) {
	case DUCK_STATE.WANDERING:
		//Moving to a random point it can see.
		mp_potential_step_object(targetX,targetY,moveSpeed/3,obj_blocker);
		if CheckIfAtTarget() {
			if satisfaction > 0 {
				satisfaction--;
				FindNewWanderSpot(820);
			} else {
				state = DUCK_STATE.SEARCHING;
			}
		}
	break;
	case DUCK_STATE.SEARCHING:
		//Duck will look for the player
		if (collision_line(x,y,obj_player.x,obj_player.y - 15,obj_blocker,false,true) == noone) {
			//If the duck can see the player.
			targetX = obj_player.x;
			targetY = obj_player.y;
			state = DUCK_STATE.ATTACKING;
		} else {
			if CheckIfAtTarget() {
				FindNewWanderSpot();
			}
		}
		mp_potential_step_object(targetX,targetY,moveSpeed/2,obj_blocker);
	break;
	case DUCK_STATE.ATTACKING:
		//Moving towards the last known location of the player, while checking still looking for the player.
		if (collision_line(x,y,obj_player.x,obj_player.y - 15,obj_blocker,false,true) == noone) {
			targetX = obj_player.x;
			targetY = obj_player.y;
		} else {
			if CheckIfAtTarget() {
				state = DUCK_STATE.SEARCHING;
			}
		}
		mp_potential_step_object(targetX,targetY,moveSpeed,obj_blocker);
	break;
	case DUCK_STATE.EATING:
		//Moving to the closest food, that it can see.
	break;
}