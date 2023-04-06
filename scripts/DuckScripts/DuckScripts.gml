// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FindNewWanderSpot(xMin = 20, yMin = 20, xMax = room_width-20, yMax = room_height-20){
	targetX = clamp(random_range(x-300,x+300),xMin,xMax);
	targetY = clamp(random_range(y-300,y+300),yMin,yMax);
	
	//Recursive Method so that the Target will never be on a wall.
	if (collision_point(targetX,targetY,obj_blocker,false,true)) FindNewWanderSpot(xMin,yMin,xMax,yMax);
}

function CheckIfAtTarget() {
	return (distance_to_point(targetX,targetY) < 5);
}