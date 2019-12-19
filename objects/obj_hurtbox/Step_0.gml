if (is_projectile == true) {
	scr_set_state_sprite(spr_necromancer_projectile, 1.0, 0);
	scr_move_and_collide(image_xscale * sped, 0);
}