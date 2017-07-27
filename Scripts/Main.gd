extends Node2D
onready var enemy = preload("res://Enemy.tscn")
onready var spawn_ = get_node("Position2D")
onready var spawn_place = get_node("Position2D").get_global_pos()

func _ready():
	pass
	
	

