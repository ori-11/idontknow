extends Node2D
var speed = 0
signal graze 
func _process(delta):
	position.x += speed 


func _on_area_2d_body_entered(body):
	body.queue_free()
	queue_free()
	pass # Replace with function body.

func _on_grazething_body_entered(body):
	if body == get_node("/root/Node2D/Camera2D/CharacterBody2D"):
		get_node("/root/Node2D/Camera2D/CharacterBody2D").points += 100
	pass
