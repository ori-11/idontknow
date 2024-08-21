extends Node2D

var randomy = null
var randomx = null
var enemy = load("res://scenes/Enemy.tscn")
var door = load("res://scenes/door.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	#position.x += 1 ### I tried to create working parallax background but bullets doesn't let me to do it correctly.
	if $"../spawntime".is_stopped():
		randomy = randompos()
		randomx = randompos()
		enemyspawn()
		$"../spawntime".start()
	if $"../doorspawn".is_stopped():
		randomy = randompos()
		randomx = randompos()
		doorspawn()
		$"../doorspawn".start()
	pass

func enemyspawn():
	var newenemy = enemy.instantiate()
	newenemy.setup()
	add_child(newenemy)
	newenemy.position = Vector2(randomx, randomy)
	newenemy.get_child(0).texture = loadedscript.image

func doorspawn():
	var newdoor = door.instantiate()
	add_child(newdoor)
	newdoor.position = Vector2(randomx, randomy)

func randompos():
	var random = RandomNumberGenerator.new()
	random.randomize()
	return random.randi_range(-243, 243)

func _on_spawntime_timeout():
	$"../spawntime".stop()
	pass # Replace with function body.


func _on_doorspawn_timeout():
	$"../doorspawn".stop()
	pass # Replace with function body.
