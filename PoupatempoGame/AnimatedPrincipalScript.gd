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

			
func _input(event):
	if(event.type == InputEvent.KEY):
		var curPos = self.get_pos()
		var curFrame = self.get_frame()
		
		if(event.scancode == KEY_D):
			curPos.x += spd
			self.set_pos(curPos)
			if(curFrame>=8 && curFrame<10):
				curFrame += 1
			else:
				curFrame = 8
			self.set_frame(curFrame)
			self.get_tree().set_input_as_handled()

		if(event.scancode == KEY_A):
			curPos.x -= spd
			self.set_pos(curPos)
			self.get_tree().set_input_as_handled()
			
		if(event.scancode == KEY_W):
			curPos.y -= spd
			self.set_pos(curPos)
			self.get_tree().set_input_as_handled()
			
		if(event.scancode == KEY_S):
			curPos.y += spd
			self.set_pos(curPos)
			self.get_tree().set_input_as_handled()
				
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