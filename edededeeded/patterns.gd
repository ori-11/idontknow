extends Node2D

var xx = 0
var yy = 8
var zz = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	var random = RandomNumberGenerator.new()
#	random.randomize()
	
#	zz = random.randi_range(0, 1)
#	if zz == 0:
	pattern1()
	pass
	
	
	
func pattern1():
	if get_child(8).get_children():
		shoot(0, 1)
		shoot(1, 1)
		delay(4)
		shoot(4, 1)
		shoot(6, 2)
		
		shoot(7, 3)
		delay(7)
		shoot(2, 3)
		shoot(3, 5)
		#get_child(1).get_child(0).shoot()
		#get_child(4).get_child(0).shoot()
		#$Timer.start()
		#get_child(6).get_child(0).timer.start()
		#get_child(6).get_child(0).shoot()
		
		#get_child(7).get_child(0).shoot()
	pass

func pattern2():
	while xx < get_child_count():
		get_child(xx).position.x = 389
		xx += 1
	xx = 0

func shoot(a, b):
	get_child(a).get_child(0).pridurok = true
	get_child(a).get_child(0).timer.wait_time = b
	if get_child(a).get_child(0).timer.is_stopped():
		get_child(a).get_child(0).shoot()
		get_child(a).get_child(0).timer.start()
		
func delay(a):
	get_child(a).get_child(0).pridurok = false


func _on_timer_timeout():
	$Timer.stop()
	pass # Replace with function body.
