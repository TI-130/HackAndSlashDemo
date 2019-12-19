x += random_range(-screenshake, screenshake);
y += random_range(-screenshake, screenshake);
if (!instance_exists(obj_player)) exit;

var target_x = obj_player.x + obj_player.image_xscale * x_offset;
var target_y = obj_player.y + y_offset;
x = lerp(x, target_x , x_speed_percent);
y = lerp(y, target_y + y_offset,y_speed_percent);

camera_set_view_pos(view_camera[0], x - width/2, y - height/2);