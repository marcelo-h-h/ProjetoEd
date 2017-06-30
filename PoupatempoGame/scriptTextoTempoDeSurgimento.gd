extends Timer

func _ready():
	set_process(true)
	
func _process(delta):
	get_node("textoTempodeSurgimento").set_text(String(round(get_time_left())))
	get_node("textoTempodeSurgimento").set_scale(Vector2(1.5, 1.5))
	
	
