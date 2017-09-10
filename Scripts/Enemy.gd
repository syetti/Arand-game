extends KinematicBody2D
export (PackedScene) var Enemy_bullet
var health = 100
onready var Timeout = get_node("Timer")

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if is_colliding():
		var collider = get_collider()
		if collider.is_in_group("Bullet"):
			health -= 100


func _on_Timer_timeout():
	var Enemybull = Enemy_bullet.instance()
	get_parent().add_child(Enemybull)
	Enemybull.set_global_pos(get_node("Enemybulspawn").get_global_pos())



#func _on_Collision_stufsf_area_enter( area ):
	#if area.is_in_group("Bullet"):
		#health -= 25
	#if health <= 0:
		#queue_free()
		#get_tree().get_root().get_node("CRT/Viewport/Main/Enemy_timer").start()

