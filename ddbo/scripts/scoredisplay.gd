extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	set_text(str(loadedscript.score))
	$"../AnimatedSprite2D".play()
	pass # Replace with function body.

	
