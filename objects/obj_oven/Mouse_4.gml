/// @description Insert description here
// You can write your code in this editor

if has_bread == true{
	obj_player.bread+=10;
	has_bread = false;
}
else if has_flour != true{
	if obj_player.flour >=1{
		has_flour = true;
		obj_player.flour--;
	}
}
else if has_water != true{
	if obj_player.bucket_filled == true{
		has_water = true;
		obj_player.bucket_filled = false;
	}
}



if has_flour && has_water{
	has_flour = false;
	has_water = false;
	has_bread = true;
}