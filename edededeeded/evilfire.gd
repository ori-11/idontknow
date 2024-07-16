extends Node2D
#signal graze
var speed = 0

func _process(delta):
	position.x += speed 


func _on_area_2d_body_entered(body):
	body.queue_free()
	queue_free()
	pass # Replace with function body.


#func _on_grazething_body_entered(body):
#	emit_signal("graze")
