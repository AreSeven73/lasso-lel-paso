extends Node
var sheep: PackedScene  = preload("res://sheep.tscn")

func spawnSheep():
	
	var sheepies = sheep.instantiate() as CharacterBody3D
	sheepies.position = Vector3(randi_range(Playerauto.playerposition.x-16,Playerauto.playerposition.x+16), 3, randi_range(Playerauto.playerposition.z-16,Playerauto.playerposition.z+16))
	
	$BoidFolder.add_child(sheepies)
	print("spawned sheep")
