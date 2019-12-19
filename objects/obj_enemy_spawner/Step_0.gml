var enemy_count = instance_number(obj_enemy_parent);

if (instance_exists(obj_player) && enemy_count <= obj_player.kills/4 && enemy_count <= 5) {
	
	var new_x = random_range(220, room_width - 220);
	while (point_distance(obj_player.x, 0, new_x, 0) < 200) {
		new_x = random_range(220, room_width - 220);
	}
	
	if (obj_player.level % 5 == 0) {
			instance_create_layer(new_x, obj_player.y, "Instances", obj_executioner);
	}
	var enemy = choose(obj_ghoul, obj_imp, obj_imp);
	
	instance_create_layer(new_x, obj_player.y, "Instances", enemy);
}