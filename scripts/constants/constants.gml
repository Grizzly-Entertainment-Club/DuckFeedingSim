// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Constants(){
	enum DUCK_STATE {
		WANDERING, //Moving to random point it can see.
		SEARCHING, //Moving to random point it can see, but if he sees the player, he will attack.
		ATTACKING, //Moving towards the last known location of the player.
		EATING //Moving towards the food that was thrown at him.
	}
	
	enum TRUCK_STATE {
		WAITING,
		LEAVING,
		AT_STORE,
		RETURNING
	}
}