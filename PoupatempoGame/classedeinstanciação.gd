extends Node2D

var filadepessoas = []
var ultimapos = Vector2(110,415)
var numerodepessoasinicial = 20

func _ready():
	print(get_child(0))
	var i = 0
	while i < numerodepessoasinicial:
		var pessoa = Sprite.new()
		var idade = Label.new()
		idade.set_text("18")
		pessoa.add_child(idade)
		filadepessoas.append(pessoa)
		filadepessoas[i].set_texture(load("res://Images/Average1/SideWalkStand.png"))
		add_child(filadepessoas[i])
		i += 1
#	print(filadepessoas[1].get_texture())
	for i in range(0, filadepessoas.size()):
		filadepessoas[i].set_pos(ultimapos)
		ultimapos = i*10*Vector2(5, 0) + Vector2(110,415)
	
	var novapessoa = Sprite.new()
	var labeldanovapessoa = Label.new()
	labeldanovapessoa.set_text("78")
	novapessoa.add_child(labeldanovapessoa)
	add_child(novapessoa)
	novapessoa.set_texture(load("res://Images/Average2/SideWalkStand.png"))
	print(novapessoa.get_child(0))
	_insere(novapessoa, filadepessoas)
	_ready()
		
func _insere(umapessoa, fila):
	if(int(umapessoa.get_child(0).get_text()) < 60):
		print("menor de fato")
		fila.append(umapessoa)
	else:
		for elemento in fila:
			if(int(elemento.get_child(0).get_text()) < 60):
				fila.insert (fila.find(elemento), umapessoa)
				print("maior de fato")
				break
	