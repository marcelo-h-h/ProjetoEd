extends TextureFrame

func _ready():
	set_process(true)
	
func _process(delta):
	set_size(Vector2(get_viewport_rect().size.width, get_viewport_rect().size.height)) #define o tamanho da imagem
	get_node("TextureButton").set_pos(Vector2(get_viewport_rect().size.width - get_node("TextureButton").get_size().x, get_viewport_rect().size.height - get_node("TextureButton").get_size().y)) #define a posição da imagem

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/GameScene1.tscn")
