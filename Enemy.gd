extends KinematicBody2D 
const SPEED = 800

onready var raycast = get_node("Raycast")
var health = 100

func _ready():
	set_fixed_process(true)
	
	

func _fixed_process(delta):
	
	if health <= 0:
		queue_free()
	
	
	
	if is_colliding():
		print("hero")
		var bodies = get_collider()
		
		if bodies.is_in_group("Bullet"):
			health -= 100
		
	