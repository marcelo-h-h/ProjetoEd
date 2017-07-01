extends Node2D

var filadepessoas = [] #declara a lista da fila
var ultimaPos = Vector2(110,415) #seleciona a posição da ultima pessoa da fila
var numerodepessoasinicial = 5 #Indica o numero inicial de pessoas na fila
var criados = false
var pessoaQueChegou

func _ready():
	randomize()
	set_process(true)
	var i = 0
	while i < numerodepessoasinicial: #insere o numero inicial de pessoas na fila
		criaPessoa() #instancia uma pessoa
		i += 1
	criados = true
	criaPessoa() #instancia a primeira pessoa a chegar à agência
	
func _draw():
	for i in range(0, filadepessoas.size()): #posiciona as pessoas conforme sua posição na fila
		ultimaPos = i*8*Vector2(5, 0) + Vector2(110,415)
		filadepessoas[i].set_pos(ultimaPos)
	
func _insere(umapessoa, fila): #função para inserir uma pessoa na fila conforme a ordem decrescente de idades
	var posicionou = 0 #variavel que controla se há posição para a pessoa no meio da fila
	for elemento in fila: #percorre toda a fila procurando a primeira pessoa com idade menor do que a que vai ser posicionada
		if(int(elemento.get_child(0).get_text()) < int(umapessoa.get_child(0).get_text())):
			fila.insert(fila.find(elemento), umapessoa) #insere na posição encontrada
			posicionou = 1
			break
	if(posicionou == 0): #se não há lugar no meio da fila para posicionar, insere no final
		fila.append(umapessoa)
	umapessoa.get_child(0).hide()
	
func criaPessoa(): #função para criar as pessoas que chegam na agencia
	var novapessoa = Sprite.new() #cria um novo nó do tipo sprite
	var labeldanovapessoa = Label.new() #cria um novo nó do tipo label
	novapessoa.set_pos(Vector2(736, 96)) #posiciona a pessoa à porta da agencia
	labeldanovapessoa.set_text(String(randi() %100)) #atribui uma idade à pessoa criada
	while(float(labeldanovapessoa.get_text()) < 14): #impede que pessoas com menos de 14 anos sejam criadas
		labeldanovapessoa.set_text(String(randi() %25))
	novapessoa.add_child(labeldanovapessoa) #adiciona o nó label como filho do nó sprite
	add_child(novapessoa) #adiciona o nó sprite como filho do nó principal da cena
	#define a textura da nova pessoa conforme sua idade --------------------
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
	#--------------------------------------------------------------------------
	if(criados == false):
		_insere(novapessoa, filadepessoas)
		
	pessoaQueChegou = novapessoa #atribui à variavel pessoaQueChegou o nó que foi criado 
		
	
func _atendePessoa(fila): #função que retira o primeiro nó da fila
	if(fila.empty() != true):
		fila[0].hide()
	fila.pop_front()
	update()

func get_fila(): #retorna a fila como está atualmente
	return filadepessoas
	
func get_pessoaQueChegou(): #retorna a ultima pessoa instanciada(que está na porta da agencia)
	return pessoaQueChegou

func inserirAqui(pessoa, posicao): #função para inserir na posição indicada
	filadepessoas.insert(posicao, pessoa)

