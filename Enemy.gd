extends KinematicBody2D 
const SPEED = 800

onready var raycast = get_node("Raycast")

func _ready():
	set_fixed_process(true)
	raycast.set_rot(get_rot()+1)
	

func _fixed_process(delta):
	
	var bodies = get_collider()
	
	if is_colliding():
		if bodies.is_in_group("MC"):
			set_rot(bodies.get_pos())
	