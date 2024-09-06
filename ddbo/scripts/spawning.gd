extends Node2D

var rotation_offset = 0.0

@export var bullet_scene = load("res://scenes/bulletnode.tscn")

func spawn(angle: float, bullet_data: Dictionary) -> Node:
	var bullet = bullet_scene.instantiate()
	bullet.rotation_degrees = angle
	# ... (Set other properties based on bullet_data)
	get_parent().add_child(bullet)
	return bullet

func _ready():
	randomize()
	set_process(true)

func _input(event):
	if event.is_action_pressed("shoot"):
		fire_bullets()

func _process(delta):
	rotation_offset += 0.05 * delta
	fire_bullets()

func fire_bullets():
	var bullet_data = generate_procedural_bullet()
	fire_pattern("spiral", bullet_data)

func generate_procedural_bullet() -> Dictionary:
	var bullet_data = {
		"speed": randf_range(100, 300),
		"size": randf_range(1, 10),
		"color": Color(randf(), randf(), randf()),
		"acceleration": randf_range(-50, 50)
	}
	return bullet_data

func fire_pattern(pattern_type: String, bullet_data: Dictionary):
	match pattern_type:
		"spiral":
			fire_spiral_pattern(bullet_data)
		# Add other pattern cases here

func fire_spiral_pattern(bullet_data: Dictionary):
	var angle_offset = randf() * PI * 2
	var bullet_angle_increment = PI * 2 / randf_range(30, 60)

	for i in range(randi() % 50 + 50):
		var angle = rad_to_deg(angle_offset + bullet_angle_increment * i + rotation_offset)
		spawn(angle, bullet_data)
