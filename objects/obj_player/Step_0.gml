depth = -y

up = keyboard_check(ord("W")) or keyboard_check(vk_up)
down = keyboard_check(ord("S")) or keyboard_check(vk_down)
right = keyboard_check(ord("D")) or keyboard_check(vk_right)
left = keyboard_check(ord("A")) or keyboard_check(vk_left)

var _xx = right - left;
var _yy = down - up;

if (_xx != 0 or _yy != 0) and !is_viajando {
	image_speed = 1;
	dir = point_direction(x, y, x + _xx, y + _yy);
	hspd = lengthdir_x(spd, dir);
	vspd = lengthdir_y(spd, dir);

	x += hspd;
	y += vspd;
} else {
	image_speed = 0;
}

if keyboard_check_pressed(ord("X")) {
	var _tower = instance_create_layer(x, y, "Instances", obj_tower);
	
	_tower.torre_anterior = ultima_torre
	ultima_torre = _tower
}


if keyboard_check_pressed(ord("Z")) {
    var _torre_encontrada = instance_place(x, y, obj_tower);
    if _torre_encontrada != noone {
        torre_atual = _torre_encontrada;
        is_viajando = true;
    }
}

// Verifica se o personagem está viajando
if is_viajando {
    if torre_atual.torre_anterior != noone {
        var _ultima_torre = torre_atual.torre_anterior;
        var _vel = 4;
		
        var _direcao = point_direction(x, y, _ultima_torre.x, _ultima_torre.y);
        
        x += lengthdir_x(_vel, _direcao);
        y += lengthdir_y(_vel, _direcao);
        
        if place_meeting(x, y, _ultima_torre) {
            if !keyboard_check(ord("Z")) {
                is_viajando = false;
            }
            torre_atual = _ultima_torre;
        }
    } else {
        is_viajando = false;
    }
}

sprite_index = is_viajando ? spr_player_viajando : spr_player

if vida <= 0 {
	room_restart();	
}

if !is_viajando && ds_map_exists(vida_sprites, vida) {
    sprite_index = ds_map_find_value(vida_sprites, vida);
}

if alarm[0] > 0 {
	image_alpha = 0.5;	
} else {
	image_alpha = 1;	
}