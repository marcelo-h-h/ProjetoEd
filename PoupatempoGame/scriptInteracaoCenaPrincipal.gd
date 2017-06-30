extends Node2D


var mostrandoTexto = false
var filaDeComparacao = []

func _ready():
	set_process(true)
	set_process_input(true)
	for pos in range(0, get_node("Node/Node2D").get_fila().size()): #cria uma fila para comparar com a editada pelo usuario
		filaDeComparacao.append(get_node("Node/Node2D").get_fila()[pos])


func _input(event):
	if(event.is_action_pressed("colocarNaFila")):
		print("pressionado")
		var filasIguais = true
		var ondeColocar = null
		for elemento in get_node("Node/Node2D").get_fila():
			var disx = (elemento.get_pos().x - get_node("KinematicBody2D").get_pos().x)
			var disy = (elemento.get_pos().y - get_node("KinematicBody2D").get_pos().y)
			if (disx > -13 && disx < 13 && disy > -100 && disy < 100 ):
				ondeColocar = elemento
		var disx = (get_node("Node/Node2D").get_pessoaQueChegou().get_pos().x - get_node("KinematicBody2D").get_pos().x)
		var disy = (get_node("Node/Node2D").get_pessoaQueChegou().get_pos().y - get_node("KinematicBody2D").get_pos().y)
		if (disx > -100 && disx < 100 && disy > -13 && disy < 13 ):
				ondeColocar = filaDeComparacao.size()
				filaDeComparacao.append(get_node("Node/Node2D").get_pessoaQueChegou())
		if(ondeColocar != null):
			filaDeComparacao.insert(filaDeComparacao.find(ondeColocar), get_node("Node/Node2D").get_pessoaQueChegou())
			get_node("Node/Node2D")._insere(get_node("Node/Node2D").get_pessoaQueChegou(), get_node("Node/Node2D").get_fila())
			for pos in range(0, filaDeComparacao.size()):
				if(filaDeComparacao[pos] != get_node("Node/Node2D").get_fila()[pos]):
					filasIguais = false
					break
			if(filasIguais):
				print("filas iguais")
				print(filaDeComparacao)
				print(get_node("Node/Node2D").get_fila())
				get_node("Node/Node2D").update()
				get_node("Node/Node2D").criaPessoa()
				get_node("tempoDeSurgimento").start()
				if(get_node("Node/Node2D").get_fila().size() > 15):
					get_tree().change_scene("res://Scenes/winScene.tscn")
			else:
				print("LOSER")
				get_tree().change_scene("res://Scenes/EndGameScene.tscn")
func _process(delta):
	for elemento in get_node("Node/Node2D").get_fila():
		var posx = (elemento.get_pos().x - get_node("KinematicBody2D").get_pos().x)
		var posy = (elemento.get_pos().y - get_node("KinematicBody2D").get_pos().y)
		if (posx > -13 && posx < 13 && posy > -100 && posy < 100 && Input.is_key_pressed(KEY_SPACE)):
			elemento.get_child(0).show()
			mostrandoTexto = true
		elif(mostrandoTexto):
			elemento.get_child(0).hide()
			
		

func _on_tempoDeSurgimento_timeout():
	get_tree().change_scene("res://Scenes/EndGameScene.tscn")
	

func _on_tempoDeAtendimentonto1_timeout():
	get_node("Node/Node2D")._atendePessoa(get_node("Node/Node2D").get_fila())
	filaDeComparacao.pop_front()
