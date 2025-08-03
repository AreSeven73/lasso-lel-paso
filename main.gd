extends Node
var sheep: PackedScene  = preload("res://sheep.tscn")
var waiting = false
var boostcount = 0 
var tracksplayed = 0

func spawnSheep():
	
	var sheepies = sheep.instantiate() as CharacterBody3D
	sheepies.position = Vector3(randi_range(Playerauto.playerposition.x-16,Playerauto.playerposition.x+16), 3, randi_range(Playerauto.playerposition.z-16,Playerauto.playerposition.z+16))
	
	$BoidFolder.add_child(sheepies)
	print("spawned sheep")
	
func _process(delta):
	$playerfollow/CameraPivot/Camera3D/Label.text = str(Playerauto.score)
	$playerfollow/CameraPivot/Camera3D/Label2.text = str(snapped($Timer2.time_left, 1))
	if not waiting:
		$Timer.start(randi_range(1, 8))
		waiting = true
		
	if not ($AudioStreamPlayer.playing or $AudioStreamPlayer2.playing or $AudioStreamPlayer3.playing or $AudioStreamPlayer4.playing or $AudioStreamPlayer5.playing or $AudioStreamPlayer6.playing or $AudioStreamPlayer7.playing or $AudioStreamPlayer8.playing or $AudioStreamPlayer9.playing):
		if min(boostcount, tracksplayed) == 0:
			$AudioStreamPlayer.play()
			tracksplayed = 1
		elif min(boostcount, tracksplayed) == 1:
			$AudioStreamPlayer2.play()
			tracksplayed = 2
		elif min(boostcount, tracksplayed) == 2:
			$AudioStreamPlayer3.play()
			tracksplayed = 3
		elif min(boostcount, tracksplayed) == 3:
			$AudioStreamPlayer4.play()
			tracksplayed = 4
		elif min(boostcount, tracksplayed) == 4:
			$AudioStreamPlayer5.play()
			tracksplayed = 5
		elif min(boostcount, tracksplayed) == 5:
			$AudioStreamPlayer6.play()
			tracksplayed = 6
		elif min(boostcount, tracksplayed) == 6:
			$AudioStreamPlayer7.play()
			tracksplayed = 7
		elif min(boostcount, tracksplayed) == 7:
			$AudioStreamPlayer8.play()
			tracksplayed = 8
		elif min(boostcount, tracksplayed) >= 8:
			$AudioStreamPlayer9.play()
			tracksplayed = 9
	
	
	
	
	
	
func extratime():
	var time = $Timer2.time_left + 10
	$Timer2.start(time)
	boostcount+=1



func _on_timer_timeout():
	var cycle = 0
	var rnadomer = randi_range(1,$BoidFolder.get_children().size())
	for i in $BoidFolder.get_children():
		cycle+=1
		if cycle == rnadomer:
			i.boostsheep()
   
	waiting = false


func _on_ready():
	$Timer2.start(100)


	

func _on_timer_2_timeout():
	$playerfollow/CameraPivot/Camera3D/Label3.text = "Times up! You rounded up " + str(Playerauto.score) + " fluff"
