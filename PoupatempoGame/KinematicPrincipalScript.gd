extends KinematicBody2D

var MOTION_SPEED = 300
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	var motion = Vector2()
	
	if (Input.is_key_pressed(KEY_W)):
		motion += Vector2(0, -1)
	if (Input.is_key_pressed(KEY_S)):
		motion += Vector2(0, 1)
	if (Input.is_key_pressed(KEY_D)):
		motion += Vector2(1, 0)
	if (Input.is_key_pressed(KEY_A)):
		motion += Vector2(-1, 0)
	
	motion = motion.normalized()*MOTION_SPEED*delta
	move(motion)
	
func _input(event):
	if(event.type == InputEvent.KEY):
        #Player movement animation----------------------------------------
       # var curPos = self.get_pos()
		if(event.scancode == KEY_D):
			get_node("Personagem").set_animation("AndandoDir")
			self.get_tree().set_input_as_handled()
		if(event.scancode == KEY_A):
			get_node("Personagem").set_animation("AndandoEsq")
		if(event.scancode == KEY_W):
			get_node("Personagem").set_animation("AndandoCima")
		if(event.scancode == KEY_S):
			get_node("Personagem").set_animation("AndandoBaixo")
			
		if(event.scancode == KEY_D && event.pressed == false):
			get_node("Personagem").set_animation("ParadoDir")
		if(event.scancode == KEY_A && event.pressed == false):
			get_node("Personagem").set_animation("ParadoEsq")
		if(event.scancode == KEY_W && event.pressed == false):
			get_node("Personagem").set_animation("ParadoCima")
		if(event.scancode == KEY_S && event.pressed == false):
			get_node("Personagem").set_animation("ParadoBaixo")
       
