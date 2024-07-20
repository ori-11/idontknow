extends Area2D
@onready var pridurok = preload("res://pridurok.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 45
	rotation += 5
	pass


func _on_body_entered(body):
	get_node("/root/Node2D/ParallaxBackground/ParallaxLayer/AnimatedSprite2D").set_material(pridurok)
	pass # Replace with function body.
