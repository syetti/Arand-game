extends KinematicBody2D


var RUN_SPEED = 1000
var velocity = Vector2(RUN_SPEED, 0)
func _ready():
	set_process(true)
	


func _process(delta):
	var motion = velocity * delta
	move(motion)
	
	
	
	if is_colliding():
		
		var bodies = get_collider()
		
		if bodies.is_in_group("Bullet_death"):
			queue_free()
		if bodies.is_in_group("Enemy"):
			queue_free()
		

	