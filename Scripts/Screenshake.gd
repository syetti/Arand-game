extends Camera2D

onready var Health = get_node("../Health/Healthb1")
var health = 100 

var screenshake = 0

func _ready():
	set_process_input(true)
	set_process(true)

	
func _process(delta):
	var randomnessinshake = Vector2(rand_range(-0.6, 0.6)*screenshake, rand_range(0.7, 0.7)*screenshake)
	set_offset(randomnessinshake)
	
	if screenshake > 0:
		screenshake -= 1
	if screenshake < 0:
		screenshake = 0

func _input(event):
	var click = Input.is_action_pressed("ui_select")

	if click and screenshake == 0:
		screenshake = 25.8
		
	if health <= 0:
		screenshake = 0