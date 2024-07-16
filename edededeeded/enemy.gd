extends CharacterBody2D
@export var fireball = preload("res://fireball.tscn")
var speed = -50

func _ready():
	var random = RandomNumberGenerator.new()
	random.randomize()
	
	position.y = random.randi_range(-243, 243)
	position.x = 600
	#position.y = randi() % 243 - 243
func _physics_process(delta):
	position.x = 540
	move_and_slide()
	pass


func _on_timer_timeout():
	var fire = fireball.instantiate()
	$Node2D.add_child(fire)
	fire.reparent(get_node("/root/Node2D"))
	fire.speed = speed
	fire.scale.x = -1
	$Timer.start()
	pass # Replace with function body.
