extends KinematicBody2D
var viradoPara = 'B'
var MOTION_SPEED = 300


func _ready():
	set_fixed_process(true)
#	set_process_input(true)
	set_pos(Vector2(get_viewport_rect().size.width/2, get_viewport_rect().size.height/2))
	
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
	
	if(motion == Vector2(0,0)):
			if(viradoPara == 'D'):
				get_node("Personagem").set_animation("ParadoDir")       
			if(viradoPara == 'E'):
				get_node("Personagem").set_animation("ParadoEsq")
			if(viradoPara == 'C'):
				get_node("Personagem").set_animation("ParadoCima")
			if(viradoPara == 'B'):
				get_node("Personagem").set_animation("ParadoBaixo")
	if(motion != Vector2(0, 0)):
			if(motion.x > 3):
				get_node("Personagem").set_animation("AndandoDir")
				viradoPara = 'D'
			if(motion.x < -3):
				get_node("Personagem").set_animation("AndandoEsq")
				viradoPara = 'E'
			if(motion.y < -3):
				get_node("Personagem").set_animation("AndandoCima")
				viradoPara = 'C'
			if(motion.y > 3):
				get_node("Personagem").set_animation("AndandoBaixo")
				viradoPara = 'B'
				
func _input(event):
	var posAtual = get_pos()
        #Player movement animation----------------------------------------
 
	if(event.type == InputEvent.KEY):
#		if(event.scancode == KEY_D && event.pressed):
#			get_node("Personagem").set_animation("AndandoDir")
#			viradoPara = 'D'
#		if(event.scancode == KEY_A && event.pressed):
#			get_node("Personagem").set_animation("AndandoEsq")
#			viradoPara = 'E'
#		if(event.scancode == KEY_W && event.pressed):
#			get_node("Personagem").set_animation("AndandoCima")
#			viradoPara = 'C'
		if(event.scancode == KEY_S && event.pressed):
#			get_node("Personagem").set_animation("AndandoBaixo")
			viradoPara = 'B'

		#if(event.scancode == KEY_D && event.pressed == false):
#			get_node("Personagem").set_animation("ParadoDir")
#		if(event.scancode == KEY_A && event.pressed == false):
#			get_node("Personagem").set_animation("ParadoEsq")
#		if(event.scancode == KEY_W && event.pressed == false):
#			get_node("Personagem").set_animation("ParadoCima")
#		if(event.scancode == KEY_S && event.pressed == false):
#			get_node("Personagem").set_animation("ParadoBaixo")
		
				
		