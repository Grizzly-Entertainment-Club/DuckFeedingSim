//Bucket Icon
draw_sprite(spr_bucket,obj_player.bucketFilled,0,0)

//Flour Icon
draw_sprite(spr_flour,0,0,50)
draw_set_halign(fa_center);
draw_text(31,82,obj_player.flour)

//Draw Money
draw_set_halign(fa_right);
draw_text(room_width - 5,0,"$" + string(money));