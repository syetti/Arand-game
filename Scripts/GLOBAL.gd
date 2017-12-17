extends Node

##################################################################
func Hit_punche():
	var Time = Timer.new()
	add_child(Time)
	Time.set_pause_mode(PAUSE_MODE_PROCESS)
	Time.set_wait_time(0.1)
	Time.connect("timeout", self, "on_time_timeout")
	Time.start()

	get_tree().set_pause(true)
	null


func Hit_punch():
	var Time = Timer.new()
	add_child(Time)
	Time.set_pause_mode(PAUSE_MODE_PROCESS)
	Time.set_wait_time(0.2)
	Time.connect("timeout", self, "on_time_timeout")
	Time.start()

	get_tree().set_pause(true)
	null

func on_time_timeout():
	get_tree().set_pause(false)
	null
####################################################################
	
func DTransition():
	get_node("/root/CRT").queue_free()
	get_tree().change_scene("res://Death_screen/CRT.scn")
	
####################################################################
var screenshake = 0
func _process(delta):
	var camera = get_node("/root/CRT/Viewport/Main/Camera2D")
	screenshake = 10.8
	var randomnessinshake = Vector2(rand_range(-0.6, 0.6)*screenshake, rand_range(-0.7, 0.7)*screenshake)
	camera.set_offset(randomnessinshake)
	if screenshake > 0:
		screenshake -= 1.2
	if screenshake <= 0:
		screenshake = 0
		
		
	
################################################################
