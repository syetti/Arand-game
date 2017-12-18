extends Node2D
var Enemy = preload("res://Enemy.tscn")
var Enemy2 = preload("res://Enemy-2.tscn")
var Levelpopup = preload("res://Leveltext.tscn")
onready var spawn_ = get_node("Spaw_enemy")
onready var spawn_2 = get_node("Spaw_enemy2")
onready var spawn_place = spawn_.get_global_pos()
onready var spawn_place2 =spawn_2.get_global_pos()
var espawn = false
signal Enemyenter


func _ready():
	Levelpopup.connect("enemy_spawn", self, "spawn_enemy")
	null

	
	

func spawn_enemy():
	espawn = true
		

func level_up():
	var level_popup = Levelpopup.instance()
	get_parent().add_child(level_popup)
	

func spawn_E1():
	var Enemyy = Enemy.instance()
	get_parent().add_child(Enemyy)
	Enemyy.set_global_pos(spawn_place)
	emit_signal("Enemyenter")
	
func spawn_E2():
		var Enemyy = Enemy2.instance()
		get_parent().add_child(Enemyy)
		Enemyy.set_global_pos(spawn_place2)

	



func _on_Enemy_timer_timeout():
	spawn_E1()


func _on_Enemy2_timer_timeout():
	spawn_E2()
