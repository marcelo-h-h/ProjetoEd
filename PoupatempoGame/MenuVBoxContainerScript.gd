extends VBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.set_size(Vector2(4*(self.get_viewport().get_rect().size.width/6), 6*(self.get_viewport().get_rect().size.height/8)))
	self.set_pos(Vector2(self.get_viewport().get_rect().size.width/6,self.get_viewport().get_rect().size.height/8))


func _on_ExitButton_pressed():
	self.get_tree().quit()


func _on_StartButton_pressed():
	get_tree().change_scene("res://GameScene.tscn")
	
