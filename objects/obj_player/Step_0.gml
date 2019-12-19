scr_get_input();

switch (state) {
	case "move":
		#region move state
		if (right_key) {
			scr_move_and_collide(sped, 0);
			image_xscale = 1;
			if (sword_drawn == false) {
				scr_set_state_sprite(spr_player_run, run_image_speed, 0);
			} else {
				scr_set_state_sprite(spr_player_run_sword, run_image_speed, 0);
			}
		}
		
		if (left_key) {
			scr_move_and_collide(-sped, 0);
			image_xscale = -1;
			if (sword_drawn == false) {
				scr_set_state_sprite(spr_player_run, run_image_speed, 0);
			} else {
				scr_set_state_sprite(spr_player_run_sword, run_image_speed, 0);	
			}
		}
		
		if (!right_key && !left_key) {
			if (sword_drawn == false) {
				scr_set_state_sprite(spr_player_idle, idle_image_speed, 0);
			} else {
				scr_set_state_sprite(spr_player_idle_sword, idle_image_speed, 0);
			}
		} else {
			if scr_animation_hit_frame(1) or scr_animation_hit_frame(3) or scr_animation_hit_frame(5) {
				audio_play_sound(a_footstep, 2, false);	
			}
		}
		
		if (slide_key && sprite_index != spr_player_idle) {
			state = "slide";
		}
		
		if (draw_key) {
			state = "draw_sword";
		}
		
		if (attack_key_press && sword_drawn == true) {
			state = "attack1";
		}
		#endregion
		break;
		
	case "draw_sword": 
		#region draw sword
		if (sword_drawn == false) {
				scr_set_state_sprite(spr_player_draw_sword, draw_sht_sword_image_speed, 0);
				if (scr_animation_end()) {
					sword_drawn = true;
					state = "move";
				}
				
		} else {
			scr_set_state_sprite(spr_player_sht_sword, draw_sht_sword_image_speed, 0);
				if (scr_animation_end()) {
					sword_drawn = false;
					state = "move";
				}
		}
		
		#endregion
		break;
		
	case "slide":
		#region slide state
		scr_set_state_sprite(spr_player_slide, slide_image_speed, 0);
		fix_xscale = image_xscale;
		scr_move_and_collide(fix_xscale * slide_speed, 0);
		if (scr_animation_end()) {
			state = "move";	
		}
		#endregion
		break;
		
	case "attack1":
		#region attack1 state
		scr_set_state_sprite(spr_player_attack_one, attack_one_image_speed, 0);
		scr_move_and_collide(image_xscale * 0.01, 0);
		if (scr_animation_hit_frame(2)) {
			scr_create_hurtbox(x, y, self, spr_player_hurtbox_one, attack_one_knockback, attack_life_span, attack_one_damage, image_xscale);
			audio_play_sound(a_miss, 3, false);
		}
		
		if (attack_key && scr_animation_hit_index_range(3,4)) {
			state = "attack2";
		}
		
		if (scr_animation_end()) {
			state = "move";	
		}
		
		#endregion
		break;
		
	case "attack2":
		#region attack2 state
		scr_set_state_sprite(spr_player_attack_two, attack_two_image_speed, 0);
		scr_move_and_collide(image_xscale * -0.01, 0);
		if (scr_animation_hit_frame(3))
		{
			scr_create_hurtbox(x, y, self, spr_player_hurtbox_two, attack_two_knockback, attack_life_span, attack_two_damage, image_xscale);
			audio_play_sound(a_miss, 3, false);
		}
		
		if (attack_key && scr_animation_hit_index_range(4,5)) {
			state = "attack3";
			image_index = 0;
		}
		
		if (scr_animation_end()) {
			state = "move";	
		}
		
		#endregion
		break;
		
	case "attack3":
		#region attack3 state
		scr_set_state_sprite(spr_player_attack_three, attack_three_image_speed, 0);
		scr_move_and_collide(image_xscale * 0.1, 0);
		if (scr_animation_hit_frame(2))
		{
			scr_create_hurtbox(x, y, self, spr_player_hurtbox_two, attack_three_knockback, attack_life_span, attack_three_damage, image_xscale);
			audio_play_sound(a_miss, 3, false);
		}
		if (scr_animation_end()) {
			state = "move";	
		}
		#endregion
		break;
	
	case "knockback":
		#region knockback state
		scr_knockback(spr_player_hurt, hurt_image_speed, knockback_friction, hurt_screenshake_duration,
		hurt_screenshake_intensity);
		if (knockback_speed == 0) {
			state = "move";
		}
		#endregion
		break;
		
	case "die":
		#region die state
		scr_set_state_sprite(spr_player_die, 0.3, 0);
		scr_screenshake(5, 8);
		if (scr_animation_end()) {
			instance_destroy();		
			room_goto(room_game_over);
		}
		#endregion
		break;
		
	default:
		show_debug_message("State" + state + " does not exist.");
		state = "move";
}