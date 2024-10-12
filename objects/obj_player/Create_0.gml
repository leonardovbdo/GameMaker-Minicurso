right = -1
left = -1
up = -1
down = -1

hspd = -1
vspd = -1
spd = 0.5
dir = -1

// viajar
ultima_torre = instance_find(obj_tower, 0);

torre_atual = noone
is_viajando = false;

// combate
vida = 30;
vida_sprites = ds_map_create();

ds_map_add(vida_sprites, 30, spr_player);
ds_map_add(vida_sprites, 20, spr_player_meia_vida);
ds_map_add(vida_sprites, 10, spr_player_zero_vida);