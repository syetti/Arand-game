extends PopupPanel

signal enemy_spawn

func _ready():
	get_node("Timer").start()
	popup()


func _on_Timer_timeout():
	emit_signal("enemy_spawn")
	self.hide()
