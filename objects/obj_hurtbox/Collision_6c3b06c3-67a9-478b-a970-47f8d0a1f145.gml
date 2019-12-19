if (creator == other || ds_list_find_index(hit_objects, other) != -1 || 
	(object_get_parent(creator.object_index) == obj_enemy_parent && 
	object_get_parent(other.object_index) == obj_enemy_parent)) {
	exit;
}

if (other.object_index == obj_player) {
	repeat(10) {
		instance_create_layer(obj_player.x, obj_player.y - 10, "effects", obj_hit_effect);	
	}
} else {
	repeat(10) {
		instance_create_layer(other.x, other.y - 10, "effects", obj_hit_effect);	
	}
	other.alarm[0] = 120;	
}

other.hp -= damage;
ds_list_add(hit_objects, other);
other.state = "knockback";
other.knockback_speed = knockback * sign(other.x - creator.x);

