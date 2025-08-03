extends Label



func _ready():
	$"..".visible = false
	
	await get_tree().create_timer(4.5).timeout
	showText("Master: Son, all you gotta do is run round the yard with your WASD keys", 1, 4)
	$"../AudioStreamPlayer".play()
	await get_tree().create_timer(4.5).timeout
	showText("Master: and your lasso, well, dont tell me you forgot how to use it. Just use left click.", 1, 7)
	$"../AudioStreamPlayer2".play()
	await get_tree().create_timer(10).timeout
	showText("Lel Paso: Uhh..What was I doing here again?", 0, 2)
	$"../AudioStreamPlayer3".play()
	await get_tree().create_timer(2.5).timeout
	showText("Master: Ughh, Ill just say it one more time.", 1, 3)
	$"../AudioStreamPlayer4".play()
	await get_tree().create_timer(3.5).timeout
	showText("Master: Ever since the Dave and the little boy came, Ive been put out of business.", 1, 4)
	$"../AudioStreamPlayer5".play()
	await get_tree().create_timer(4.5).timeout
	showText("Master: Theyre showing me up!", 1, 2)
	$"../AudioStreamPlayer6".play()
	await get_tree().create_timer(2.5).timeout
	showText("Master: Go run around in the yard, son. And get all those sheep baby.", 1, 5)
	$"../AudioStreamPlayer7".play()
	await get_tree().create_timer(5.5).timeout
	showText("Master: I need all that baa baa black wool, huh", 1, 3.5)
	$"../AudioStreamPlayer8".play()
	await get_tree().create_timer(4).timeout
	showText("Master: You know what they say about black gold heh? The gold ones are extra special ah, hehehheh.", 1, 6)
	$"../AudioStreamPlayer9".play()
	await get_tree().create_timer(6.1).timeout
	showText("Master: Make sure to catch them!", 1, 1.5)
	$"../AudioStreamPlayer10".play()
	await get_tree().create_timer(2).timeout
	showText("Master: Lets just say, Ill make it worth your while.", 1, 3)
	$"../AudioStreamPlayer11".play()
	await get_tree().create_timer(3.5).timeout
	showText("Master: Ill even award you with extra time, heheheh. Keep it up.", 1, 5)
	$"../AudioStreamPlayer12".play()
	await get_tree().create_timer(5.5).timeout


func showText(storytext, speaker, time = 0):
	print("show text")
	$"..".visible = true
	text = str(storytext)
	if speaker == 0:
		$"../lelpaso".visible = true
		$"../master".visible = false
	elif speaker == 1:
		$"../lelpaso".visible = false
		$"../master".visible = true
	
	await get_tree().create_timer(time).timeout
	$"..".visible = false
	
	#frames:
	#dogman is 0
	#master is 1
	

