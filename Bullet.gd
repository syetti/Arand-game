extends KinematicBody2D

var velocity = Vector2() 
const RUN_SPEED = 400
func _ready():
	set_fire(true)
	pass

func fire():
	var motion = velocity.x * RUN_SPEED
	move(motion)