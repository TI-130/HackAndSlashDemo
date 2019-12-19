/// @arg knockback_sprit
/// @arg sprite_image_speed
/// @arg knockback_friction
/// @arg screenshake_duration
/// @arg screenshake_intensity
var sprit = argument0;
var image_sped = argument1;
var knockback_fric = argument2;
var sc_shake_duration = argument3;
var sc_shake_intensity = argument4;

scr_set_state_sprite(sprit, image_sped, 0);
scr_move_and_collide(knockback_speed, 0);
scr_screenshake(sc_shake_duration, sc_shake_intensity);
knockback_speed = scr_approach(knockback_speed, 0, knockback_fric);