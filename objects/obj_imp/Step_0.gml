if (!instance_exists(obj_player)) exit;
switch (state) {
	case "chase": 
		#region chase state
		if (place_meeting(x, y, obj_player) && attacked == false){
			scr_create_hurtbox(x, y, self, sprite_index, knockback, 1, damage, image_xscale);
			attacked = true;
		}
		
		if (attacked == true) {
			vspeed = -1;	
		}
		#endregion
		break;
	
	case "knockback":
		#region knockback state
		scr_set_state_sprite(spr_imp_hurt, hurt_image_speed, 0);
		scr_move_and_collide(knockback_speed, 0);
		knockback_speed = scr_approach(knockback_speed, 0, knockback_friction);
		if (knockback_speed == 0) {
			state = "chase";
		}
		#endregion
		break;
	
	case "die":
		#region die state
		scr_set_state_sprite(spr_imp_die, 1.0, 0);
		if (scr_animation_end()) {
			instance_destroy();			
		}
		#endregion
		break;
		
	default:
		show_debug_message("State" + state + " does not exist.");
		state = "move";
}