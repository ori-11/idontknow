extends CharacterBody2D
@onready var fireball = preload("res://fireball.tscn")
var speed = 50
var SPEED = 500
var target_velocity = Vector2.ZERO
var points = 0

func _ready():
	print(get_script())
#func _init():
	#Signals.connect("time", time)
	#Signals.connect("timefaster", timefaster)
func _input(event):
	if event.is_action_pressed("fire"):
		var fire = fireball.instantiate()
		$Node2D.add_child(fire)
		fire.reparent($"../..")
		fire.speed = speed
func _physics_process(delta):
	#var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#velocity = direction * SPEED
	
	#move_and_slide() 
	var direction = Input.get_vector("a", "d", "w", "s")
	target_velocity = direction * SPEED
	target_velocity.x -= delta # 10 is the force
	target_velocity.y += delta
	velocity = lerp(velocity, target_velocity, delta*10.0)
	velocity.x -= lerp(SPEED, 0, 0.95)
	velocity.y += lerp(SPEED, 0, 0.95)
	move_and_slide() 
	
#func time():
#	SPEED = 150
#	speed = 10

#func timefaster():
#	SPEED = 300
#	speed = 50
