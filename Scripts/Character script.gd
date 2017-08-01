extends KinematicBody2D

export (PackedScene) var bullet_
var Velocity = Vector2()
var Speed = 800
onready var Health = get_node("../Health/Healthb1")
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
	
	if Move_Right:
		Velocity.x = Speed
	elif Move_Left:
		Velocity.x = -Speed
	elif stop_moving_x:
		Time.start()
		
		Velocity.x = 0
		
	if Move_Down:
		Velocity.y = Speed
	elif Move_Up:
		Velocity.y = -Speed
	elif stop_moving_y:
		Time.start()
		
		Velocity.y = 0
	
func _fixed_process(delta):
	if health <= 0:
		get_node("/root/CRT/Viewport/Gameover").show()
		get_node("/root/CRT/Viewport/Main").hide()
		print("gameover")
				 
			
	
		

	
	var motion = Velocity * delta
	motion = move(motion)

	if is_colliding():
		var bodies = get_collider()
		
		if bodies.is_in_group("Wall"):
			var normal = get_collision_normal()
			motion = normal.slide(motion)
			Velocity = normal.slide(Velocity)
			move(motion)
			
		elif bodies.is_in_group("Enemy"):
				health -=  1
				health
	Health.set_value(health)
	

func _on_Timer_timeout():
	if not is_colliding():
		health += 1
		
func fire():
	var bullet = bullet_.instance()
	get_parent().add_child(bullet)
	bullet.set_global_pos(get_node("Bulletspawn").get_global_pos())
	bullet.hide()
