event_inherited();
switch (state) {
	case "move":
		#region move state
		//show_debug_message("move");
		image_speed = 0.6;
		sprite_index = spr_executioner_idle;
		
		if (instance_exists(obj_player)) {
			if	(abs(obj_player.x - x) < chase_range) {
				state = "chase";
				image_index = 0;
			} 
		}
		
		
		#endregion
		break;
		
	case "chase":
		#region chase state
		//show_debug_message("chase");
		if (instance_exists(obj_player)) {
			if (abs(obj_player.x - x) > chase_range) {
				state = "move";	
				image_index = 0;
			}
			if (abs(obj_player.x - x) > attack_range) {
				scr_set_state_sprite(spr_executioner_move, run_image_speed, 0);
				if (x - obj_player.x > 0) {
					image_xscale = 1;
					scr_move_and_collide(-image_xscale * sped, 0);
				} else if (x - obj_player.x < 0) {
					image_xscale = -1;
					scr_move_and_collide(-image_xscale * sped, 0);
				}
			}
		}
		
		if (instance_exists(obj_player)) {
			if (abs(obj_player.x - x) <= attack_range && 
			(sign(image_xscale) == sign(x - obj_player.x ) || sign(image_xscale) == sign(obj_player.x - x))) {
				if (hp <= max_hp / 2 && frenzy_used == false) {
					state = "frenzy";
					frenzy_used = true;
					alarm[1] = 300;
				} else {
					state = "attack";
				}
				image_index = 0;
			}
		}
		#endregion
		break;
		
	case "attack":
		#region attack state
		//show_debug_message("attack");
		scr_set_state_sprite(spr_executioner_attack, attack_image_speed, 0);
		if (scr_animation_hit_frame(2)) {
			audio_play_sound(a_big_hit, 2, false);
			scr_create_hurtbox(x, y, self, spr_executioner_hurtbox, knockback, attack_lifespan, damage, image_xscale);
		}
		
		if (scr_animation_end()) {
			state = "move";
		}
		#endregion
		break;
		
	case "frenzy":
		#region frenzy state
		//show_debug_message("frenzy");
		scr_set_state_sprite(spr_executioner_attack, 2 * attack_image_speed, 0);
		if (scr_animation_hit_frame(2)) {
			audio_play_sound(a_big_hit, 2, false);
			scr_create_hurtbox(x, y, self, spr_executioner_hurtbox, knockback, attack_lifespan, damage, image_xscale);
		} 
		
		if (scr_animation_end()) {
			image_xscale = -image_xscale;	
		}
		#endregion
		break;
		
	case "knockback":
		#region knockback state
		//show_debug_message("knockback");
		scr_knockback(spr_executioner_hurt, hurt_image_speed, knockback_friction, hurt_screenshake_duration,
		hurt_screenshake_intensity);
		if (alarm[1] != -1) {
			state = "frenzy";	
		}
		
		if (knockback_speed == 0) {
			state = "move";
		}
		#endregion
		break;
		
	case "die":
		#region die state
		scr_screenshake(death_screenshake_duration, death_screenshake_intensity);
		scr_set_state_sprite(spr_executioner_die, die_image_speed, 0);
		if (scr_animation_end()) {
			instance_destroy();			
		}
		#endregion
		break;
		
	default:
		show_debug_message("State" + state + " does not exist.");
		state = "move";
}