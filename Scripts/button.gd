extends Button

# class member variables go here, for example:
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

	

func _on_Button_2_pressed():
	get_tree().change_scene("res://Main.tscn")
	self.set_disabled(true)
	get_node("/root/Start_screen").queue_free()

	
