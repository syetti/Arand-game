extends Node

var stage = 1

func _ready():
	null


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
const full_time = 0.3



func Screenshake():
	var shaking = false
	var screenshake = 0
	var time = 0
	var normal_offset = Vector2(0,0)

	var camera = get_node("/root/CRT/Viewport/Main/Camera2D")
	if shaking: return
		shaking = true

	while time < full_time:
		time += get_fixed_process_delta_time()
		time = min(time, full_time)
		screenshake = 5.8
		var randomnessinshake = Vector2(rand_range(-0.6, 0.6)*screenshake, rand_range(-0.7, 0.7)*screenshake)
		camera.set_offset(normal_offset + randomnessinshake)
		yield(get_tree(), "idle_frame")
	camera.set_offset(normal_offset)
	screenshake = 0
	time = 0
	shaking = false

################################################################
func Level_up(level):
	stage = level
	var Level = "Level "
	var text = get_node("/root/CRT/Viewport/Popup/RichTextLabel")
	text.set_bbcode(str(Level , level))
	