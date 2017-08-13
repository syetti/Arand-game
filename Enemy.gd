extends KinematicBody2D
var health = 100

onready var area = get_node("Area2D")

func _ready():
	pass




	
	

func _on_Area2D_body_enter( body ):
	
	if body.is_in_group("Bullet"):
		health -= 25
		body.queue_free()
		print("dane")
	if health <= 0:
		queue_free()
