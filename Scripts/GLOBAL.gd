extends Node
onready var Gameover = preload("res://Death_screen/CRT.scn")

func ready():
	connect("death", self, "DTransition")
	
func DTransition():
	get_node("/root/CRT").queue_free()
	var Deathscreen = Gameover.instance()
	add_child(Deathscreen)

