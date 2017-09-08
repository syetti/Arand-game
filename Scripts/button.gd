extends Button

func _ready():
	
	pass


func _on_Button_pressed():
	print("pressed")
	get_tree().change_scene("res://CRTViewportDisplay/CRT.scn")
	
