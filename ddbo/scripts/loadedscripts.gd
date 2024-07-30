extends Node

var image = null

enum levels{
	grass,
	snow,
	level
}

var currentlevel = levels

func _input(event):
	if event.is_action_pressed("T"):
		Engine.max_fps = 10
	elif event.is_action_released("T"):
		Engine.max_fps = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
