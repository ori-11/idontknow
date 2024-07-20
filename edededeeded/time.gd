extends Node2D
var xx = 0
@export var enemy = preload("res://enemy.tscn")


func _physics_process(delta):
	
	if $spawntime.is_stopped():
		xx = 0
		while $Camera2D/spawnpositions.get_child_count() > xx+1:
			if !$Camera2D/spawnpositions.get_child(xx).get_children():
				var newenemy = enemy.instantiate()
				$Camera2D/spawnpositions.get_child(xx).add_child(newenemy)
				newenemy.position = $Camera2D/spawnpositions.get_child(xx).position
				newenemy.get_child(0).texture = $Camera2D/temp.image_t
			xx += 1
		$spawntime.start()
	pass


func _on_spawntime_timeout():
	$spawntime.stop()
	#print("stop")
	pass # Replace with function body.
