extends CharacterBody2D

var speed = 50
var SPEED = 1000
var target_velocity = Vector2.ZERO



# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	target_velocity = direction * SPEED
	target_velocity.x -= delta # 10 is the force
	target_velocity.y += delta
	velocity = lerp(velocity, target_velocity, delta*10.0)
	velocity.x -= lerp(SPEED, 0, 0.95)
	velocity.y += lerp(SPEED, 0, 0.95)
	move_and_slide() 
	


func _on_area_2d_area_entered(area):
	queue_free()
	pass # Replace with function body.
