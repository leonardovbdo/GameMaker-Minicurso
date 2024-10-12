torre_anterior = noone

var _ultima_torre = obj_player.ultima_torre

if _ultima_torre  != noone {
	
	var _list = ds_list_create();
	
	var _num = collision_line_list(x, y, _ultima_torre.x, _ultima_torre.y, obj_enemy, true, true, _list, false);
	
	if _num > 0 {
		for (var i = 0; i < _num; i++) {
			_list[|i].is_congelado = true;	
		}
	}
	ds_list_destroy(_list)
	
}