extends KinematicBody2D
var viradoPara = 'B'
var MOTION_SPEED = 300


func _ready():
	set_fixed_process(true)
	set_pos(Vector2(get_viewport_rect().size.width/2, get_viewport_rect().size.height/8))
	
func _fixed_process(delta):
#-----------------Movimenta o personagem principal ---------------------------
	var motion = Vector2()
	
	if (Input.is_action_pressed("ui_up")):
		motion += Vector2(0, -1)
	if (Input.is_action_pressed("ui_down")):
		motion += Vector2(0, 1)
	if (Input.is_action_pressed("ui_right")):
		motion += Vector2(1, 0)
	if (Input.is_action_pressed("ui_left")):
		motion += Vector2(-1, 0)
	
	motion = motion.normalized()*MOTION_SPEED*delta
	move(motion)
#----------------------------------------------------------------------------
#------------------------Modifica a animação da sprite-----------------------
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
			if(motion.x > 2):
				get_node("Personagem").set_animation("AndandoDir")
				viradoPara = 'D'
			if(motion.x < -2):
				get_node("Personagem").set_animation("AndandoEsq")
				viradoPara = 'E'
			if(motion.y < -3):
				get_node("Personagem").set_animation("AndandoCima")
				viradoPara = 'C'
			if(motion.y > 3):
				get_node("Personagem").set_animation("AndandoBaixo")
				viradoPara = 'B'
#--------------------------------------------------------------------------

func _input(event):
	var posAtual = get_pos()

 
	if(event.type == InputEvent.KEY):
		if(event.scancode == KEY_S && event.pressed):
			viradoPara = 'B'

