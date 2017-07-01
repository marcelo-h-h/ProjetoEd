extends TextureButton


func _ready():
	set_process(true)
func _process(delta):
		set_pos(Vector2(get_viewport_rect().size.width/4 - get_rect().size.width/2, get_viewport_rect().size.height/2))
