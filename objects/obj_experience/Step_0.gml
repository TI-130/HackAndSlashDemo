if (!instance_exists(obj_player)) exit;
var dir = point_direction(x, y, obj_player.x, obj_player.y);
var acceleration = 0.25;
motion_add(dir, acceleration);