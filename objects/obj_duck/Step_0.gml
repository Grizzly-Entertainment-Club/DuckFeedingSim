switch (state) {
	case DUCK_STATE.WAITING:
		timer--;
		if (timer <= 0) {
			timer = 60;
			satisfaction--;
			target = obj_player;
			wander_x = clamp(x + (random(800) - 400),800,room_width);
			wander_y = clamp(y + (random(800) - 400),0,room_height);
			if (satisfaction > 0) {
				state = DUCK_STATE.WAITING;
			} else {
				satisfaction = 0;
				target = obj_player;
				state = DUCK_STATE.ATTACKING;
			}		
		}
	break;
	case DUCK_STATE.WANDERING:
		direction = point_direction(x,y,wander_x,wander_y);
		if (distance_to_point(wander_x,wander_y) < 1) {
			speed = 0;
			state = DUCK_STATE.WAITING;
		} else {
			speed = 0.5;
		}
	break;
	case DUCK_STATE.ATTACKING:
		direction = point_direction(x,y,target.x,target.y);
		speed = 2;
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
				satisfaction = 5;
				timer = 60;
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