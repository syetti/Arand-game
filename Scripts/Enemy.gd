extends KinematicBody2D
var Speed = 900
onready var Raycast = get_node("RayCast2D")
onready var Enemy_anims = get_node("AnimationPlayer")
func _ready():
	randomize(rand_range(1,3))
	if 1:
		Enemy_anims.play("Enemy")
	elif 2:
		Enemy_anims.play("Enemy_invert")
	
	
	if Raycast.is_colliding():
		var bodies = get_collider()
		
		if bodies.is_in_group("MC"):
			var MChere = get_collision_pos()
			move_to(MChere * Speed)