ini_open("save.ini");
ini_write_real("Score", "Kills", obj.obj_player.kills);
return ini_read_real("Score", "highscore", 0);