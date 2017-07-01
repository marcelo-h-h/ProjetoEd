extends Node2D


var mostrandoTexto = false
var filaDeComparacao = [] #cria uma lista que será a fila de comparaçao

func _ready():
	set_process(true)
	set_process_input(true)
	for pos in range(0, get_node("Node/Node2D").get_fila().size()): #cria uma fila para comparar com a editada pelo usuario
		filaDeComparacao.append(get_node("Node/Node2D").get_fila()[pos]) #essa fila é inicializada identica à ja existente


func _input(event):
	if(event.is_action_pressed("colocarNaFila")): #quando o jogar aperta para inserir na fila
		var filasIguais = true #antes de serem modificadas, as filas estão iguais
		var ondeColocar = null #antes de inserir, não é definida a posição a inserir
		for elemento in get_node("Node/Node2D").get_fila(): #verifica se o personagem principal está próximo de alguém da fila
			var disx = (elemento.get_pos().x - get_node("KinematicBody2D").get_pos().x)
			var disy = (elemento.get_pos().y - get_node("KinematicBody2D").get_pos().y)
			if (disx > -13 && disx < 13 && disy > -100 && disy < 100 ):
				ondeColocar = elemento #se ele está próximo e pressiona para inserir, a posição a inserir será a posição da pessoa de quem ele está próximo
		var disx = (get_node("Node/Node2D").get_pessoaQueChegou().get_pos().x - get_node("KinematicBody2D").get_pos().x)
		var disy = (get_node("Node/Node2D").get_pessoaQueChegou().get_pos().y - get_node("KinematicBody2D").get_pos().y)
		if (disx > -100 && disx < 100 && disy > -13 && disy < 13 ): #se o jogador estiver próximo a pessoa que chegou quando aperta inserir
				ondeColocar = filaDeComparacao.size() #A pessoa que chegou deve ser inserida no final da fila
				filaDeComparacao.append(get_node("Node/Node2D").get_pessoaQueChegou()) #insere a pessoa na final da fila de comparação
		if(ondeColocar != null):
			filaDeComparacao.insert(filaDeComparacao.find(ondeColocar), get_node("Node/Node2D").get_pessoaQueChegou()) #insere a pessoa na posição encontrada na fila de comparação
			get_node("Node/Node2D")._insere(get_node("Node/Node2D").get_pessoaQueChegou(), get_node("Node/Node2D").get_fila()) #insere a pessoa na posição da fila conforme as regras do jogo
			for pos in range(0, filaDeComparacao.size()): #verifica se a fila editada segundo comando do jogador é igua à fila editada segundo as regras do jogo
				if(filaDeComparacao[pos] != get_node("Node/Node2D").get_fila()[pos]):
					filasIguais = false
					break
			if(filasIguais): #se as filas estiverem iguais
				get_node("Node/Node2D").update() #redesenha a fila após a inserção
				get_node("Node/Node2D").criaPessoa() #cria uma nova pessoa na porta da agência
				get_node("tempoDeSurgimento").start() #reinicia o tempo da pessoa aguardando ser posicionada
				if(get_node("Node/Node2D").get_fila().size() > 15): #se a fila tiver mais de 15 pessoas, o jogador ganha o jogo
					get_tree().change_scene("res://Scenes/winScene.tscn")
			else: #se as filas estiverem diferentes
				get_tree().change_scene("res://Scenes/EndGameScene.tscn")
func _process(delta):
	for elemento in get_node("Node/Node2D").get_fila(): #verifica se o jogador está apertando para exibir a idade próximo de alguém da fila
		var posx = (elemento.get_pos().x - get_node("KinematicBody2D").get_pos().x)
		var posy = (elemento.get_pos().y - get_node("KinematicBody2D").get_pos().y)
		if (posx > -13 && posx < 13 && posy > -100 && posy < 100 && Input.is_key_pressed(KEY_SPACE)):
			elemento.get_child(0).show()
			mostrandoTexto = true #se estiver, exibe a idade da pessoa próxima
		elif(mostrandoTexto):
			elemento.get_child(0).hide()
			
		

func _on_tempoDeSurgimento_timeout():
	get_tree().change_scene("res://Scenes/EndGameScene.tscn") #se acabar o tempo de espera da pessoa para ser inserida na fila, perde o jogo

func _on_tempoDeAtendimentonto1_timeout(): #atende uma pessoa da fila, tirando o primeiro nó
	get_node("Node/Node2D")._atendePessoa(get_node("Node/Node2D").get_fila())
	filaDeComparacao.pop_front()
