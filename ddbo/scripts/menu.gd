extends Control

var image_t = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_loadingimage_pressed():
	$filedialog.popup()



func _on_filedialog_file_selected(path):
	var image = Image.new()
	image.load(path)
	#image_t = ImageTexture.new()
	#image_t.set_image(image)
	loadedscript.image = ImageTexture.new()
	loadedscript.image.set_image(image)
	$start.disabled = false


func _on_start_pressed():
	visible = false
	get_tree().change_scene_to_file("res://scenes/mainscene.tscn")
	
	pass # Replace with function body.
