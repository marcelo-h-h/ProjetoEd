extends Node2D

var filadepessoas = []
var ultimaPos = Vector2(110,415)
var numerodepessoasinicial = 5
var criados = false
var pessoaQueChegou

func _ready():
	randomize()
	set_process(true)
	var i = 0
	while i < numerodepessoasinicial:
		criaPessoa()
		i += 1
	criados = true
	criaPessoa()
	#get_node("tempoDeSurgimento").set_wait_time(20)
	#get_node("tempoDeAtendimento").set_wait_time(60)
	
	
func _draw():
	for i in range(0, filadepessoas.size()):
		ultimaPos = i*8*Vector2(5, 0) + Vector2(110,415)
		filadepessoas[i].set_pos(ultimaPos)
	

func _insere(umapessoa, fila):
	if(int(umapessoa.get_child(0).get_text()) < 60):
		fila.append(umapessoa)
	else:
		var posicionou = 0
		for elemento in fila:
			if(int(elemento.get_child(0).get_text()) < int(umapessoa.get_child(0).get_text())):
				fila.insert(fila.find(elemento), umapessoa)
				posicionou = 1
				break
		if(posicionou == 0):
			fila.append(umapessoa)
	umapessoa.get_child(0).hide()
	
func criaPessoa():
	var novapessoa = Sprite.new()
	var labeldanovapessoa = Label.new()
	novapessoa.set_pos(Vector2(736, 96))
	labeldanovapessoa.set_text(String(randi() %100))
	while(float(labeldanovapessoa.get_text()) < 14):
		labeldanovapessoa.set_text(String(randi() %25))
	novapessoa.add_child(labeldanovapessoa)
	add_child(novapessoa)
	#define a textura da nova pessoa --------------------
	if(float(labeldanovapessoa.get_text()) < 25):
		var sorteio = randi() % 3 #define a ordem da sprite (0 a 2)
		if(sorteio == 0):
			novapessoa.set_texture(load("res://Images/Young2/SideWalkStand.png"))
		elif(sorteio == 1):
			novapessoa.set_texture(load("res://Images/Average1/SideWalkStand.png"))
		elif(sorteio == 2):
			novapessoa.set_texture(load("res://Images/Average2/SideWalkStand.png"))
	elif(float(labeldanovapessoa.get_text()) >= 25 && float(labeldanovapessoa.get_text()) < 60):
		var sorteio = randi() % 2 #define a ordem da sprite (0 ou 1)
		if(sorteio == 0):
			novapessoa.set_texture(load("res://Images/Average1/SideWalkStand.png"))
		if(sorteio == 1):
			novapessoa.set_texture(load("res://Images/Average2/SideWalkStand.png"))
	elif(float(labeldanovapessoa.get_text()) >= 60):
		var sorteio = randi() % 3 #define a ordem da sprite (0 a 2)
		if(sorteio == 0):
			novapessoa.set_texture(load("res://Images/Elder1/SideWalkStand.png"))
		elif(sorteio == 1):
			novapessoa.set_texture(load("res://Images/Average1/SideWalkStand.png"))
		elif(sorteio == 2):
			novapessoa.set_texture(load("res://Images/Average2/SideWalkStand.png"))
	novapessoa.set_scale(Vector2(1.4, 1.4))
	#------------------------------	
	if(criados == false):
		_insere(novapessoa, filadepessoas)
		
	pessoaQueChegou = novapessoa
		

func _on_tempoDeSurgimento_timeout():
	print("deu timeout")
	
func _atendePessoa(fila):
	if(fila.empty() != true):
		fila[0].hide()
	fila.pop_front()
	update()
	print("atendeu")
	
	
func _on_tempoDeAtendimento_timeout():
	_atendePessoa(filadepessoas)

func get_fila():
	return filadepessoas
	
func get_pessoaQueChegou():
	return pessoaQueChegou

func inserirAqui(pessoa, posicao):
	filadepessoas.insert(posicao, pessoa)


