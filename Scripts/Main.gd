extends Node2D
var Enemy = preload("res://Enemy.tscn")
onready var spawn_ = get_node("Spaw_enemy")
onready var spawn_place = spawn_.get_global_pos()

func _ready():
	pass
	

	



func _on_Enemy_timer_timeout():
	var Enemyy = Enemy.instance()
	get_parent().add_child(Enemyy)
	Enemyy.set_global_pos(spawn_place)
	
