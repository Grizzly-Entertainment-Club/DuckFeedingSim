switch (state) {
	
	//Duck is waiting at a set posistion.
	case DUCK_STATE.WAITING:
		timer--;
		if (timer <= 0) {
			timer = 60;
			satisfaction--;
			target = obj_player;
			wanderX = clamp(x + (random(800) - 400),800,room_width);
			wanderY = clamp(y + (random(800) - 400),0,room_height);
			if (satisfaction > 0) {
				state = DUCK_STATE.WAITING;
			} else {
				satisfaction = 0;
				target = obj_player;
				state = DUCK_STATE.ATTACKING;
			}		
		}
	break;
	
	//Duck is walking to a random posistion.
	case DUCK_STATE.WANDERING:
		direction = point_direction(x,y,wanderX,wanderY);
		if (distance_to_point(wanderX,wanderY) < 1) {
			speed = 0;
			state = DUCK_STATE.WAITING;
		} else {
			speed = 0.5;
		}
	break;
	
	//Duck is attacking the player.
	case DUCK_STATE.ATTACKING:
		direction = point_direction(x,y,target.x,target.y);
		speed = 2;
		var inst = collision_circle(x,y,smellRange,obj_bread,true,true);
		if (inst != noone) {
			state = DUCK_STATE.EATING;
			target = inst;
		}
	break;
	
	//Duck is eating bread.
	case DUCK_STATE.EATING:
		var player = collision_circle(x,y,eatRange,target,true,true);
		if (player != noone) {
			target.hp--;
			speed = 0;
			if (target.hp <= 0) {
				instance_destroy(target);
				satisfaction = 5;
				timer = 60;
				target = obj_player;
				wanderX = x + (random(200) - 100);
				wanderY = y + (random(200) - 100);
				state = DUCK_STATE.WANDERING;
			}
		} else {
			direction = point_direction(x,y,target.x,target.y);
			speed = 2;
		}
	break;
	
}