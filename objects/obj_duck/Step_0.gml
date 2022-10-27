speed = moveSpeed;
if (instance_exists(obj_bread)) {
	direction = point_direction(x,y,obj_bread.x,obj_bread.y);
} else {
	direction = point_direction(x,y,obj_player.x,obj_player.y);
}