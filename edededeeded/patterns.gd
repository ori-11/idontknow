extends Node2D

var xx = 0
var yy = 0
var zz = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	var random = RandomNumberGenerator.new()
#	random.randomize()
	
#	zz = random.randi_range(0, 1)
#	if zz == 0:
	pattern1()
	#if $"../Timer".is_stopped():
	#	change()
	#	$"../Timer".start()
	#else:
#		pass
	pass
	
	
	
func pattern1():
	
	if get_child(0).get_children():
		get_child(0).get_child(0).get_child(2).start()
		get_child(1).get_child(0).get_child(2).start()
		get_child(4).get_child(0).get_child(2).start()
		$Timer.wait_time = 1.0
		$Timer.start()
		if $Timer.is_stopped():
			get_child(6).get_child(0).get_child(2).start()
			$Timer.start()
			if $Timer.is_stopped():
				get_child(7).get_child(0).get_child(2).start()
	pass

func pattern2():
	while xx < get_child_count():
		get_child(xx).position.x = 389
		xx += 1
	xx = 0

func change():
	if zz == false:
		#pattern1()
		zz = true
	else:
		#pattern2()
		zz = false

func _on_timer_timeout():
	$Timer.stop()
	pass # Replace with function body.
