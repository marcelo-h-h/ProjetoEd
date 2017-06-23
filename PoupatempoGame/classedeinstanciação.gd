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
		criaPessoa()
		i += 1
	get_node("tempoDeSurgimento").set_wait_time(5.2)
	
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
	while(float(labeldanovapessoa.get_text()) < 14):
		labeldanovapessoa.set_text(String(randi() %25))
	novapessoa.add_child(labeldanovapessoa)
	add_child(novapessoa)
	#define a textura da nova pessoa --------------------
	var sorteio = randi() % 2 #define a ordem da sprite (0 ou 1)
	if(float(labeldanovapessoa.get_text()) < 25):
		#if(sorteio == 0):
		novapessoa.set_texture(load("res://Images/Young2/SideWalkStand.png"))
	elif(float(labeldanovapessoa.get_text()) >= 25 && float(labeldanovapessoa.get_text()) < 60):
		if(sorteio == 0):
			novapessoa.set_texture(load("res://Images/Average1/SideWalkStand.png"))
		if(sorteio == 1):
			novapessoa.set_texture(load("res://Images/Average2/SideWalkStand.png"))
	elif(float(labeldanovapessoa.get_text()) > 60):
		novapessoa.set_texture(load("res://Images/Elder1/SideWalkStand.png"))
		
	_insere(novapessoa, filadepessoas)


func _on_Button_pressed():
	criaPessoa()
	print(filadepessoas)
	update()


func _on_tempoDeSurgimento_timeout():
	get_node("tempoDeSurgimento").start()
	criaPessoa()
	update()
	
