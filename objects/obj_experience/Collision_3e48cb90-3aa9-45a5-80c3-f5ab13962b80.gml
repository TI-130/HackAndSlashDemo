if (!instance_exists(obj_player)) exit;
with (other) {
	experience++;
	audio_play_sound(a_expr, 2, false);
	if (experience > max_experience) {
		level++;
		experience = experience - max_experience;
		max_experience *= 2;
		max_hp += 10;
		hp = max_hp;
		
		strength += 5;
	}
}
instance_destroy();