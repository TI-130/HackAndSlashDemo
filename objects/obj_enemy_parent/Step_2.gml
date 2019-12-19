if not instance_exists(obj_player) exit;
event_inherited();
if (hp <= 0 && state != "die") {
	state = "die";
	obj_player.kills += 1;	
	repeat(experience) { 
		instance_create_layer(x + random_range(-3, 3), y + random_range(-3, 3), "effects", obj_experience);	
	}
}