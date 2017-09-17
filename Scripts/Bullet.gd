extends RigidBody2D

onready var anim = get_node("AnimationPlayer")
var RUN_SPEED = 42000
var velocity = Vector2(RUN_SPEED, 0)
func _ready():
	set_process(true)
	


func _process(delta):
	var motion = velocity * delta
	set_linear_velocity(motion)

	var body = get_colliding_bodies()

	if body.is_in_group("Enemy"):
		anim.play("Bullexplode")
		queue_free()
	
	if body.is_in_group("Bullet_death"):
			queue_free()






	
		

