// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FindNewWanderSpot(){
	targetX = clamp(random_range(x-300,x+300),20,room_width - 20);
	targetY = clamp(random_range(y-300,y+300),20,room_height - 20);
}

function CheckIfAtTarget() {
	return (distance_to_point(targetX,targetY) < 5);
}