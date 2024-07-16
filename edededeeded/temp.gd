extends Control
@onready var character = get_node("/root/Node2D/Camera2D/CharacterBody2D")
var image_t
func _input(event):
	if event.is_action_pressed("load"):
		$FileDialog.popup()

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text("FPS: " + str(Engine.get_frames_per_second()))
	if character != null:
		$Label2.set_text("graze points: " + str(character.points))
	else:
		$Label2.set_text("You lost =(")
	pass


func _on_file_dialog_file_selected(path):
	var image = Image.new()
	image.load(path)
	image_t = ImageTexture.new()
	image_t.set_image(image)
	#get_node("/root/Enemy/sprite").texture = image_t
	pass # Replace with function body.
