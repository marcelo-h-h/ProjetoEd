extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var mostrandoTexto = false

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	for elemento in get_node("Node/Node2D").get_fila():
		var posx = (elemento.get_pos().x - get_node("KinematicBody2D").get_pos().x)
		var posy = (elemento.get_pos().y - get_node("KinematicBody2D").get_pos().y)
		if (posx > -13 && posx < 13 && posy > -100 && posy < 100 && Input.is_key_pressed(KEY_SPACE)):
			elemento.get_child(0).show()
			mostrandoTexto = true
		elif(mostrandoTexto):
			elemento.get_child(0).hide()
			