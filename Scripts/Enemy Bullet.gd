extends RigidBody2D

var RUN_SPEED = 1000
var velocity = Vector2(-RUN_SPEED, 0)

func _ready():
	set_process(true)

func _process(delta):
	var motion = velocity * delta
	set_linear_velocity(motion)
	