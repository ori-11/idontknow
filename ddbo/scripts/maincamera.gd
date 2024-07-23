extends Node2D

var randomy = null
var randomx = null
var enemy = load("res://scenes/Enemy.tscn")
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
	pass

func enemyspawn():
	var newenemy = enemy.instantiate()
	add_child(newenemy)
	newenemy.position = Vector2(randomx, randomy)
	newenemy.get_child(0).texture = loadedscript.image

func randompos():
	var random = RandomNumberGenerator.new()
	random.randomize()
	return random.randi_range(-243, 243)

func _on_spawntime_timeout():
	$"../spawntime".stop()
	pass # Replace with function body.
