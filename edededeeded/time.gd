extends Node2D

@export var enemy = preload("res://enemy.tscn")

func _physics_process(delta):
	if $spawntime.is_stopped():
		var newenemy = enemy.instantiate()
		$Camera2D.add_child(newenemy)
		newenemy.get_child(0).texture = $Camera2D/temp.image_t
		$spawntime.start()
	pass


func _on_spawntime_timeout():
	$spawntime.stop()
	#print("stop")
	pass # Replace with function body.
