switch (state) {
	case "move":
		#region move state
		image_speed = 0.6;
		sprite_index = spr_necromancer_idle;
		
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
		if (instance_exists(obj_player)) {
			if (abs(obj_player.x - x) > sight_range) {
				state = "move";	
				image_index = 0;
			}
			if (abs(obj_player.x - x) > attack_range) {
				scr_set_state_sprite(spr_necromancer_move, run_image_speed, 0);
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
			if (abs(obj_player.x - x) <= attack_range) {
				state = "attack";
				image_index = 0;
			}
		}
		#endregion
		break;
		
	case "attack":
		#region attack state
		scr_set_state_sprite(spr_necromancer_attack, attack_image_speed, 0);
		if (scr_animation_hit_frame(2))
		{
			show_debug_message("Missle fire!");
			scr_create_projectile(x - image_xscale * 37, y - 22, self, spr_necromancer_projectile, knockback, 150, damage, image_xscale, 0.5);
		}
		
		if (scr_animation_end()) {
			state = "move";
		}
		#endregion
		break;
		
	case "knockback":
		#region knockback state
		scr_set_state_sprite(spr_necromancer_hurt, hurt_image_speed, 0);
		scr_move_and_collide(knockback_speed, 0);
		knockback_speed = scr_approach(knockback_speed, 0, knockback_friction);
		if (knockback_speed == 0) {
			state = "move";
		}
		#endregion
		break;
		
	case "die":
		#region die state
		scr_set_state_sprite(spr_necromancer_die, 1.0, 0);
		if (scr_animation_end()) {
			instance_destroy();			
		}
		#endregion
		break;
		
	default:
		show_debug_message("State" + state + " does not exist.");
		state = "move";
}