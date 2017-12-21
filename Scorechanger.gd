extends Control

signal score_changed

var score = 0 setget _set_score


func _ready():
	pass

func _set_score(new_value):
	score = new_value
	emit_signal("score_changed")
	
	if new_value == 2:
		get_tree().get_root().get_node("CRT/Viewport/Main").level_up()
		get_tree().get_root().get_node("CRT/AnimationPlayer").play("CRT")
		get_tree().get_root().get_node("CRT/Viewport/Main/Enemy2_timer").start()
		get_tree().get_root().get_node("CRT/Viewport/Main/Enemy_timer").set_active(false)
		GLOBAL.stage += 1
	if new_value == 4:
		get_tree().get_root().get_node("CRT/Viewport/Main").level_up()
		get_tree().get_root().get_node("CRT/AnimationPlayer").play("CRT")
		GLOBAL.stage += 1
	
