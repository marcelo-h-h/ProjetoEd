extends Label



func _ready():
	set_process(true)
	set_text("Você Venceu!")
	set_scale(Vector2(2, 2))
	
func _process(delta):
		set_pos(Vector2(get_viewport_rect().size.width/5 - get_rect().size.width/2, get_viewport_rect().size.height/3))