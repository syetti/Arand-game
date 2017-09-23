extends Camera2D

var screenshake = 0

func _ready():
	set_process_input(true)
	set_process(true)

	
func _process(delta):
	var randomnessinshake = Vector2(rand_range(-0.6, 0.6)*screenshake, rand_range(0.7, 0.7)*screenshake)
	set_offset(randomnessinshake)
	
	if screenshake > 0:
		screenshake -= 1.8
	if screenshake < 0:
		get_node("Timer").stop()
		screenshake = 0

func _input(event):
	var click = Input.is_action_pressed("ui_select")

	if click and screenshake == 0:
		get_node("Timer").start()
		screenshake = 10.8
