extends RigidBody2D

onready var anim = get_node("AnimationPlayer")
var RUN_SPEED = 42000
var velocity = Vector2(RUN_SPEED, 0)
func _ready():
	set_process(true)
	


func _process(delta):
	var motion = velocity * delta
	set_linear_velocity(motion)



func _on_Area2D_body_enter( body ):
	if body.is_in_group("Enemy"):
		anim.play("Bullexplode")
		queue_free()
		
		
	if body.is_in_group("Bullet_death"):
		queue_free()


func _on_Area2D_area_enter( area ):
	if area.is_in_group("Enemy"):
		anim.play("Bullexplode")

		
	if area.is_in_group("Bullet_death"):
		queue_free()


		