extends Node

func _input(event):
	if event.is_action_pressed("time"):
		Engine.set_max_fps(5)
	if event.is_action_released("time"):
		Engine.set_max_fps(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
