extends CharacterBody2D
@export var fireball = preload("res://fireball.tscn")
var speed = -50
var pridurok = true
@onready var timer = $Timer

func _ready():
	#var random = RandomNumberGenerator.new()
	#random.randomize()
	
	#position.y = random.randi_range(-243, 243)
	#position.x = 600
	#position.y = randi() % 243 - 243
	pass
func _physics_process(delta):
	move_and_slide()
	pass

func shoot():
	if timer.is_stopped() and pridurok:
		var fire = fireball.instantiate()
		$Node2D.add_child(fire)
		fire.reparent(get_node("/root/Node2D/Camera2D"))
		fire.speed = speed
		fire.scale.x = -1

func _on_timer_timeout():
	timer.stop()

