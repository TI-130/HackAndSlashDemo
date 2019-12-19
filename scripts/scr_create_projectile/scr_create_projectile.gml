/// @arg x
/// @arg y
/// @arg creator
/// @arg sprite
/// @arg knockback
/// @arg distance
/// @arg damage
/// @arg xscale
/// @arg speed
var x_position = argument0;
var y_position = argument1;
var creator = argument2;
var sprite = argument3;
var knockback = argument4;
var distance = argument5;
var damage = argument6;
var xscale = argument7;
var sped = argument8;

var hitbox = instance_create_layer(x_position, y_position, "Instances", obj_hurtbox);
hitbox.sprite_index = sprite;
hitbox.visible = true; 
hitbox.creator = creator;
hitbox.knockback = sign(image_xscale) * knockback;
hitbox.is_projectile = true;
hitbox.alarm[0] = distance/sped;
hitbox.damage = damage;
hitbox.image_xscale = xscale;

