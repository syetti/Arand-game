extends KinematicBody2D


var RUN_SPEED = 400
var velocity = Vector2(RUN_SPEED, 0)
func _ready():
	set_process_input(true)
	
	
func _input(event):
	if event.is_action_pressed("ui_select"):
		show()
		set_process(true)

func _process(delta):
	var motion = velocity * delta
	move(motion)

	