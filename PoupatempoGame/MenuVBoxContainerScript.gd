extends VBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.set_pos(Vector2(self.get_viewport().get_rect().size.width/6,self.get_viewport().get_rect().size.height/2))
	set_process(true)


	

func _process(delta):
	self.set_pos(Vector2(self.get_viewport().get_rect().size.width/6,self.get_viewport().get_rect().size.height/2))

	
	


func _on_TextureButton1_pressed():
	self.get_tree().quit()


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/GameScene1.tscn")
