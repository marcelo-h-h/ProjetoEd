extends Node2D

var filadepessoas = []
var ultimaPos = Vector2(110,415)
var numerodepessoasinicial = 10
var ultimaAge = 15

func _ready():
	randomize()
	set_process(true)
	var i = 0
	while i < numerodepessoasinicial:
		var pessoa = Sprite.new()
		var idade = Label.new()
		idade.set_text(String(randi() % 100))
		pessoa.add_child(idade)
		add_child(pessoa)
		pessoa.set_texture(load("res://Images/Average1/SideWalkStand.png"))
		_insere(pessoa, filadepessoas)
		i += 1
	get_node("tempoDeSurgimento").set_wait_time(5)
	
#	for i in range(0, filadepessoas.size()):
#		filadepessoas[i].set_pos(ultimaPos)
#		ultimaPos = i*10*Vector2(5, 0) + Vector2(110,415)
	# ---- surge nova pessoa -----------------------------------

	#-----------------------------------------------------------------------
		
func _draw():
	for i in range(0, filadepessoas.size()):
		ultimaPos = i*15*Vector2(5, 0) + Vector2(110,415)
		filadepessoas[i].set_pos(ultimaPos)
	

func _insere(umapessoa, fila):
	if(int(umapessoa.get_child(0).get_text()) < 60):
		fila.append(umapessoa)
	else:
		for elemento in fila:
			if(int(elemento.get_child(0).get_text()) < 60):
				fila.insert(fila.find(elemento), umapessoa)
				break
	
func criaPessoa():
	var novapessoa = Sprite.new()
	var labeldanovapessoa = Label.new()
	labeldanovapessoa.set_text(String(randi() %100))
	novapessoa.add_child(labeldanovapessoa)
	add_child(novapessoa)
	#aqui vai um if para determinar a textura do personagem
	novapessoa.set_texture(load("res://Images/Average2/SideWalkStand.png"))
	_insere(novapessoa, filadepessoas)


func _on_Button_pressed():
	criaPessoa()
	print(filadepessoas)
	update()


func _on_tempoDeSurgimento_timeout():
	get_node("tempoDeSurgimento").start()
	criaPessoa()
	update()
	
