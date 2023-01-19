switch (state) {
	case DUCK_STATE.WANDERING:
		direction = point_direction(x,y,wander_x,wander_y);
		if (distance_to_point(wander_x,wander_y) < 1) {
			speed = 0;
		} else {
			speed = 1;
		}
	break;
	case DUCK_STATE.ATTACKING:
		direction = point_direction(x,y,target.x,target.y);
		speed = 3;
		var inst = collision_circle(x,y,smell_range,obj_bread,true,true);
		if (inst != noone) {
			state = DUCK_STATE.EATING;
			target = inst;
		}
	break;
	case DUCK_STATE.EATING:
		var player = collision_circle(x,y,eat_range,target,true,true);
		if (player != noone) {
			target.hp--;
			speed = 0;
			if (target.hp <= 0) {
				instance_destroy(target);
				target = obj_player;
				wander_x = x + (random(200) - 100);
				wander_y = y + (random(200) - 100);
				state = DUCK_STATE.WANDERING;
			}
		} else {
			direction = point_direction(x,y,target.x,target.y);
			speed = 2;
		}
	break;
}