draw_self()


var _rosa_choque = make_color_rgb(255, 38, 116);

if torre_anterior != noone {
	draw_set_color(_rosa_choque)
	draw_line(x, y, torre_anterior.x, torre_anterior.y)	
}