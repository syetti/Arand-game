extends Node2D
var Enemy = preload("res://Enemy.tscn")
var Enemy2 = preload("res://Enemy-2.tscn")
var Level2pop = preload("res://Level2text.tscn")
onready var spawn_ = get_node("Spaw_enemy")
onready var spawn_2 = get_node("Spaw_enemy2")
onready var spawn_place = spawn_.get_global_pos()
onready var spawn_place2 =spawn_2.get_global_pos()
var espawn = false
signal Enemyenter


func _ready():
	Level2text.connect("enemy_spawn", self, "spawn_enemy")
	null

	
	

func spawn_enemy():
	espawn = true
		

func Level2():
	var level_popup = Level2pop.instance()
	get_parent().add_child(level_popup)
	

func spawn_E1():
	var Enemyy = Enemy.instance()
	get_parent().add_child(Enemyy)
	Enemyy.set_global_pos(spawn_place)
	emit_signal("Enemyenter")
	
func spawn_E2():
	if espawn == true:
		var Enemyy = Enemy2.instance()
		get_parent().add_child(Enemyy)
		Enemyy.set_global_pos(spawn_place2)

	



func _on_Enemy_timer_timeout():
	spawn_E1()


func _on_Enemy2_timer_timeout():
	spawn_E2()
