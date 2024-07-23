extends Node

var image = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("T"):
		Engine.max_fps = 10
	elif event.is_action_released("T"):
		Engine.max_fps = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
