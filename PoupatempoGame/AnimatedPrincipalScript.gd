extends AnimatedSprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var spd = 15

func _ready():
	var curPos = Vector2(self.get_parent().get_rect().size.width/2, self.get_parent().get_rect().size.height/2)
	self.set_pos(curPos)
	self.set_process_input(true)
	self.set_process(true)
	self.set_frame(0)
	self.set_animation("ParadodeFrente")
	print(self.get_animation())
		
			
func _input(event):
	if(event.type == InputEvent.KEY):
		#Player movement ----------------------------------------
		var curPos = self.get_pos()
		
		if(event.scancode == KEY_D):
			self.set_animation("AndandoDireita")
			curPos.x += spd
			self.set_pos(curPos)
			self.get_tree().set_input_as_handled()

		if(event.scancode == KEY_A):
			self.set_animation("AndandoEsquerda")
			curPos.x -= spd
			self.set_pos(curPos)
			self.get_tree().set_input_as_handled()
			
		if(event.scancode == KEY_W):
			self.set_animation("AndandodeCostas")
			curPos.y -= spd
			self.set_pos(curPos)
			self.get_tree().set_input_as_handled()
			
		if(event.scancode == KEY_S):
			self.set_animation("AndandodeFrente")
			curPos.y += spd
			self.set_pos(curPos)
			self.get_tree().set_input_as_handled()
				
		if(event.scancode == KEY_D && event.pressed == false):
			self.set_animation("ParadoDireita")
		if(event.scancode == KEY_A && event.pressed == false):
			self.set_animation("ParadoEsquerda")
		if(event.scancode == KEY_W && event.pressed == false):
			self.set_animation("ParadoCostas")
		if(event.scancode == KEY_S && event.pressed == false):
			self.set_animation("ParadodeFrente")
	#------------------------Player movement
	
func _process(delta):
	self.set_frame(self.get_frame())
	if(Input.is_key_pressed(KEY_ESCAPE)):
		if(Input.is_key_pressed(KEY_SHIFT)):
			self.get_tree().quit()
	var curPos = self.get_pos()
	if(curPos.x > self.get_viewport_rect().size.width + self.get_item_rect().size.width):
		curPos.x = -self.get_item_rect().size.width/2
		self.set_pos(curPos)
		print("moveu pra direita")
	if(curPos.x < -self.get_item_rect().size.width):
		curPos.x = self.get_viewport_rect().size.width + self.get_item_rect().size.width/2
		self.set_pos(curPos)
		print("moveu pra esquerda")
	if(curPos.y > self.get_viewport_rect().size.height + self.get_item_rect().size.height):
		curPos.y = -self.get_item_rect().size.height/2
		self.set_pos(curPos)
		print("moveu para baixo")
	if(curPos.y < -self.get_item_rect().size.height):
		curPos.y = self.get_viewport_rect().size.height
		self.set_pos(curPos)
		print("Moveu para cima")