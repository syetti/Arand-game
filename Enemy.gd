extends KinematicBody2D
var health = 100

func _on_Area2D_body_enter( body ):
	if body.is_in_group("Bullet"):
		health -= 25
		body.queue_free()
	if health <= 0:
		queue_free()
		get_tree().get_root().get_node("CRT/Viewport/Main/Enemy_timer").start()