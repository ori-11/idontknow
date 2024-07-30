extends Control

var image_t = null

func _on_loadingimage_pressed():
	$FileDialog.popup()


func _on_start_pressed():
	visible = false
	get_tree().change_scene_to_file("res://scenes/mainscene.tscn")
	
	pass # Replace with function body.


func _on_file_dialog_file_selected(path):
	var image = Image.new()
	image.load(path)
	#image_t = ImageTexture.new()
	#image_t.set_image(image)
	loadedscript.image = ImageTexture.new()
	loadedscript.image.set_image(image)
	$preview.texture = loadedscript.image
	$grass.disabled = false
	$snow.disabled = false
	$level.disabled = false


func _on_grass_pressed():
	loadedscript.currentlevel = loadedscript.levels.grass
	visible = false
	get_tree().change_scene_to_file("res://scenes/mainscene.tscn")
	pass # Replace with function body.


func _on_snow_pressed():
	loadedscript.currentlevel = loadedscript.levels.snow
	visible = false
	get_tree().change_scene_to_file("res://scenes/mainscene.tscn")
	pass # Replace with function body.


func _on_level_pressed():
	loadedscript.currentlevel = loadedscript.levels.level
	visible = false
	get_tree().change_scene_to_file("res://scenes/mainscene.tscn")
	pass # Replace with function body.
