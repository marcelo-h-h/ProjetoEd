extends Timer

func _ready():
	set_process(true)

func _process(delta):
	get_node("textoTempoDeAtendimento").set_text(String(round(get_time_left())))
	
