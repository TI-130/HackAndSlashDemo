event_inherited();
hp = 5;
max_hp = hp;
state = "chase";
image_speed = 0.8;
hspeed = random_range(1, 2);
knockback = 4;
knockback_speed = 1;
hurt_image_speed = 1;
knockback_friction = 0.8; 

if (instance_exists(obj_player)) {
	hspeed *= sign(obj_player.x - x);	
}

image_xscale = -sign(hspeed);
damage = 5;
attacked = false;
experience = 2;