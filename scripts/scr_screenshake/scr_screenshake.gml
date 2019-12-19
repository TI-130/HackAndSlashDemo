/// @arg duration
/// @arg intensity
var duration = argument0;
var intensity = argument1;

if not instance_exists(obj_camera) exit;

with (obj_camera) {
	alarm[0] = duration;
	screenshake = intensity;
}