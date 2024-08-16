extends Node2D

@onready var door = load("res://scenes/door.tscn")
var randomy = null
@onready var pxsition = $CharacterBody2D/position1
@onready var scrimbloid = load("res://scenes/scrimbloids.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	loadedscript.isLinear = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Timer.is_stopped():
		var random = RandomNumberGenerator.new()
		random.randomize()
		var debil = random.randi_range(0, 1)
		randomy = randompos()
		if debil == 0:
			doorspawn()
		else:
			scrimbloidspawn()
		$Timer.start()
	pass

func scrimbloidspawn():
	var newscrimbloid = scrimbloid.instantiate()
	newscrimbloid.position.y = randomy
	pxsition.add_child(newscrimbloid)
	newscrimbloid.reparent($".")

func doorspawn():
	var newdoor = door.instantiate()
	newdoor.position.y = randomy
	pxsition.add_child(newdoor)
	newdoor.reparent($".")
	

func randompos():
	var random = RandomNumberGenerator.new()
	random.randomize()
	return random.randi_range(pxsition.position.y-100, pxsition.position.y+100)

func _on_timer_timeout():
	$Timer.stop()
	pass # Replace with function body.
