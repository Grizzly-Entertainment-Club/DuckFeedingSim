/// @description Throw Bread
//Make sure the player is not depositing bread.
var truckInst = instance_position(mouse_x,mouse_y,obj_truck)
if truckInst == noone {
	if bread>= 1{
		instance_create_layer(x,y,"Instances",obj_bread)
		bread--;
	}
} else {
	truckInst.cargoValue += 10;
	bread--;
	DisplayError("Cargo Worth: $" + string(truckInst.cargoValue))
}