draw_self();

if alarm[0] > 0 {
	var height = sprite_height;
	draw_rectangle_color(
	x - 12, 
	y - height, 
	x - 12 + max(0, (hp/max_hp) * 24), 
	y - (height -2), 
	c_white, c_white, c_white, c_white, false);
	draw_sprite(spr_enemy_health_bar, 0, x-12, y-height);
}