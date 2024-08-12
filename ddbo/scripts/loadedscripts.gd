extends Node

var image = null

var isLinear = true

enum levels{
	grass,
	snow,
	level
}

var currentlevel = null

func _ready():
	currentlevel = levels.grass 

func _input(event):
	if event.is_action_pressed("T"):
		Engine.max_fps = 10
	elif event.is_action_released("T"):
		Engine.max_fps = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
