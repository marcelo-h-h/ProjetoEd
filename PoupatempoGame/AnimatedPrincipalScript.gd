extends AnimatedSprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var spd = 15

func _ready():
	var curPos = Vector2(self.get_viewport_rect().size.width/2, self.get_viewport_rect().size.height/2)
	self.set_pos(curPos)
	self.set_process_input(true)
	self.set_process(true)
	
	print(self.get_animation() + "ta assim")
	
		