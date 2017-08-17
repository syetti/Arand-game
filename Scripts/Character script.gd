extends KinematicBody2D

export (PackedScene) var bullet_
var Velocity = Vector2()
var Speed = 800
onready var Health = get_node("../Health/Healthb1")
onready var Areaa = get_node("Area2D")
var health = 100 
onready var Time = get_node("Timer")

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	
func _input(event):
	var Move_Right = event.is_action_pressed("ui_right")
	var Move_Left = event.is_action_pressed("ui_left")
	var stop_moving_x = not Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left")
	var Move_Down = event.is_action_pressed("ui_down")
	var Move_Up = event.is_action_pressed("ui_up")
	var stop_moving_y = not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down")
	var click = event.is_action_pressed("ui_select")
	
	if click:
		fire()
		
		Velocity.x = 0
		
	if Move_Down:
		Velocity.y = Speed
	elif Move_Up:
		Velocity.y = -Speed
	elif stop_moving_y:
		Velocity.y = 0
		
	
func _fixed_process(delta):
	var motion = Velocity * delta
	motion = move(motion)
	var area = get_collider()

	
	if health <= 0:
		get_tree().change_scene("res://CRTViewportDisplay/Death screen/CRT.scn")


	
	
	if is_colliding():
		var bodies = get_collider()
		
		#if bodies.is_in_group("Wall"):
			#var normal = get_collision_normal()
			#motion = normal.slide(motion)
			#Velocity = normal.slide(Velocity)
			#move(motion)
			
		if bodies.is_in_group("Enemybull"):
			print("hit")
			health -=  20
			
	Health.set_value(health)
	

func _on_Timer_timeout():
	if not is_colliding():
		Health.hide()
		
func fire():
	var bullet = bullet_.instance()
	get_parent().add_child(bullet)
	bullet.set_global_pos(get_node("Bulletspawn").get_global_pos())
	



	


func _on_Area2D_body_enter( body ):
	var area = get_overlapping_bodies()
	
	if area.is_in_group("Wall"):
		var normal = get_collision_normal()
		var motion = normal.slide(motion)
		Velocity = normal.slide(Velocity)
		move(motion)
	
	if body.is_in_group("Enemybull"):
		print("hittttt")
		health -=  20

