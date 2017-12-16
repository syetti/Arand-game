extends Camera2D

onready var Time = get_node("Timer")

var screenshake = 0
var can_click = true

func _ready():
	null


	
func screenshakee():
	var idle_shake = 0
	screenshake = 10.8
	var randomnessinshake = Vector2(rand_range(-3, 0.7)*screenshake, rand_range(0.7, -0.7)*screenshake)
	set_offset(randomnessinshake)
	
	if screenshake > 0:
		screenshake -= 4
	if screenshake < 0:
		screenshake = 0
		set_offset(screenshake)

func _input(event):
	var click = Input.is_action_pressed("ui_select") and can_click == true

	if click and screenshake <= 0:
		Time.start()
		can_click = false
		
func _on_Timer_timeout():
	can_click = true
	
