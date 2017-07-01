extends TextureFrame


const M_SPEED = 550
const PO_SPEED = 280 
var accum = 0 

func _process(delta):
	var m_pos = get_node("m").get_pos()
	var po_pos = get_node("po").get_pos()
	if( m_pos.x < get_node("poupatempo").get_pos().x-(get_node("poupatempo").get_size().x/2) ):
		m_pos.x += delta*M_SPEED
	elif(po_pos.x< (get_viewport().get_rect().size.width-get_node("poupatempo").get_size().width)/2):  
		po_pos.x += delta*PO_SPEED
		get_node("po").set_pos(po_pos)
	elif( m_pos.x < (get_viewport().get_rect().size.width-get_node("poupatempo").get_size().width)/2 ):
		m_pos.x+= delta*M_SPEED
	elif( m_pos.y > 0 ):
		m_pos.y -= delta*M_SPEED
	else:
		get_node("thegame").set_pos(Vector2(get_viewport().get_rect().size.width/2.5,0+get_node("thegame").get_size().y/1.8 ))
		get_node("thegame").show()
		accum+=delta
		if(accum>=0.7):
			get_node("Start").set_disabled(false)
			get_node("Start").show()
			get_node("Instrucoes").show()
	get_node("m").set_pos(m_pos)
	pass

func _ready():
	get_node("poupatempo").set_expand(true)
	get_node("poupatempo").set_size(Vector2(get_viewport().get_rect().size.width/1.4,get_viewport().get_rect().size.height/1.4))
	get_node("poupatempo").set_pos(Vector2((get_viewport().get_rect().size.width-get_node("poupatempo").get_size().width)/2,0))
	get_node("po").set_expand(true)
	get_node("po").set_size(Vector2(get_node("poupatempo").get_size().width,get_node("poupatempo").get_size().height))
	get_node("po").set_pos(Vector2((get_viewport().get_rect().size.width-2*get_node("poupatempo").get_size().width)/17,0))
	#get_node("po").set_pos(Vector2((get_viewport().get_rect().size.width-get_node("poupatempo").get_size().width)/2,0))
	get_node("m").set_expand(true)
	get_node("m").set_size(Vector2(get_node("poupatempo").get_size().width,get_node("poupatempo").get_size().height))
	get_node("m").set_pos(Vector2(-(get_node("m").get_size().x)/1.8,(get_viewport_rect().size.height-get_node("m").get_size().height)/1.18))
	get_node("Start").set_pos(Vector2((get_viewport().get_rect().size.width-get_node("Start").get_size().x)/2,get_viewport().get_rect().size.y/1.6))
	get_node("Instrucoes").set_pos(get_node("Start").get_pos() + Vector2(0, get_node("Start").get_size().y))
	set_process(true)
	
	#get_node("m").set_pos(Vector2(get_node("poupatempo").get_pos().x-(get_node("poupatempo").get_size().x/2),(get_viewport_rect().size.height-get_node("m").get_size().height)/1.18))
	

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/GameScene1.tscn")




func _on_Intrucoes_pressed():
	get_tree().change_scene("res://Scenes/InstructionsScene.tscn")
