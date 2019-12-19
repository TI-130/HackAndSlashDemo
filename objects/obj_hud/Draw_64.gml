var health_bar_x = 8;
var health_bar_y = 8;
var health_bar_length = 200;
var health_bar_width = 8;

if (instance_exists(obj_player)) {
	draw_hp = lerp(draw_hp, obj_player.hp, 0.2);
	draw_max_hp = obj_player.max_hp;
} else {
	draw_hp = lerp(draw_hp, 0, 0.2);
}

var health_percent = draw_hp / draw_max_hp;
	
draw_rectangle_color(health_bar_x, health_bar_y, health_bar_x + health_bar_length * health_percent,
		health_bar_y + health_bar_width, c_white, c_white, c_white, c_white, false);
		
draw_rectangle_color(health_bar_x, health_bar_y, health_bar_x + health_bar_length,
		health_bar_y + health_bar_width, c_black, c_black, c_black, c_black, true);
		
if (!instance_exists(obj_player)) exit;
var text = "Kills: " + string(obj_player.kills);
var text_width = string_width(text);
var text_height = string_height(text);
var start_x = 8;
var start_y = 20;
var padding_x = 6;
var padding_y = 2;
draw_rectangle_color(start_x, start_y, start_x + text_width + padding_x, start_y + text_height + padding_y, c_dkgray, c_dkgray,c_dkgray,c_dkgray, false);
draw_text(start_x + padding_x/2, start_y + padding_y/2, text);

text = "Level: " + string(obj_player.level);
text_width = string_width(text);
text_height = string_height(text);
start_x = 80;
start_y = 20;
draw_rectangle_color(start_x, start_y, start_x + text_width + padding_x, start_y + text_height + padding_y, c_dkgray, c_dkgray,c_dkgray,c_dkgray, false);
draw_text(start_x + padding_x/2, start_y + padding_y/2, text);
