extends KinematicBody2D


var RUN_SPEED = 1000
var velocity = Vector2(RUN_SPEED, 0)
func _ready():
	set_process(true)
	


func _process(delta):
	var motion = velocity * delta
	move(motion)
	
	var bodies = get_collider()
	
	if is_colliding():
		if bodies.is_in_group("Enemy"):
			pass
			

	