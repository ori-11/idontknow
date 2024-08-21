extends CharacterBody2D

@export_range(0, 1) var spin_chance := 0.5
@export_range(1, 500) var min_spin_speed := 10
@export_range(1, 500) var max_spin_speed := 200

func _ready():
	$AnimatedSprite2D.play("plant1")

func _on_area_2d_area_entered(area):
	queue_free()
	pass # Replace with function body.

func setup():
	randomize()
	
	if is_equal_approx(spin_chance, 1.0) || randf() <= spin_chance:
		$SpawnPoint.rotating_speed = randf_range(min_spin_speed, max_spin_speed)
