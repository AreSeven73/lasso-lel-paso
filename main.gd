extends Node
var sheep: PackedScene  = preload("res://sheep.tscn")
var waiting = false

func spawnSheep():
	
	var sheepies = sheep.instantiate() as CharacterBody3D
	sheepies.position = Vector3(randi_range(Playerauto.playerposition.x-16,Playerauto.playerposition.x+16), 3, randi_range(Playerauto.playerposition.z-16,Playerauto.playerposition.z+16))
	
	$BoidFolder.add_child(sheepies)
	print("spawned sheep")
	
func _process(delta):
	if not waiting:
		$Timer.start(randi_range(10, 40))
		waiting = true
	




func _on_timer_timeout():
	var cycle = 0
	var rnadomer = randi_range(1,$BoidFolder.get_children().size())
	for i in $BoidFolder.get_children():
		cycle+=1
		if cycle == rnadomer:
			i.boostsheep()
   
	waiting = false
