extends PopupPanel

signal enemy_spawn

func _ready():
	
	get_node("Timer").start()
	if get_node("Timer").start() == true:
		call_deferred("popup")


func _on_Timer_timeout():
	emit_signal("enemy_spawn")
	hide()
