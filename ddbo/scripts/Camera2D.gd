extends Camera2D

# Camera2D variables
@export var player: Node2D  # Reference to the player character
@export var camera_smoothing_speed: float = 0.1  # Camera smoothing speed
#@export var limit_top: float = -INF  # Camera boundary limit (top)
#@export var limit_bottom: float = INF  # Camera boundary limit (bottom)
#@export var limit_left: float = -INF  # Camera boundary limit (left)
#@export var limit_right: float = INF  # Camera boundary limit (right)
var target_position: Vector2  # Target position for the camera

# Spawning system variables
var enemy = load("res://scenes/Enemy.tscn")  # Enemy scene
var door = load("res://scenes/door.tscn")  # Door scene
var rng = RandomNumberGenerator.new()  # Random number generator instance

func _ready():
	# Initialize camera and randomization
	rng.randomize()  # Randomize the RNG for unique values
#	$".".current = true  # Ensure this camera is the active one
	if player:
		global_position = player.global_position  # Start centered on the player

func _process(delta: float):
	# Camera behavior - Smooth follow and boundary constraints
	if player:
		# Calculate the target position based on the player's position
		target_position = player.global_position

		# Smoothly interpolate towards the target position
		var new_position = lerp(global_position, target_position, camera_smoothing_speed)

		# Apply camera boundary limits to restrict the camera's movement
		new_position.x = clamp(new_position.x, limit_left, limit_right)
		new_position.y = clamp(new_position.y, limit_top, limit_bottom)

		# Set the camera's new position
		global_position = new_position

	# Spawning system logic
	if $"../Timer".is_stopped():
		spawn_object(enemy)
		$"../Timer".start()

	if $"../Timer2".is_stopped():
		spawn_object(door)
		$"../Timer2".start()

func spawn_object(scene: PackedScene):
	# Instantiates and spawns objects (enemy or door) at random positions
	var instance = scene.instantiate()
	add_child(instance)
	
	# Set a random position for the instance within a predefined range
	var random_position = Vector2(random_pos(-243, 243), random_pos(-243, 243))
	instance.position = random_position

func random_pos(min_val: float, max_val: float) -> float:
	# Returns a random position within the specified range
	return rng.randi_range(min_val, max_val)

# Timer timeout callbacks
func _on_spawntime_timeout():
	$"../spawntime".stop()

func _on_doorspawn_timeout():
	$"../doorspawn".stop()
