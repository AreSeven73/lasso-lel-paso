extends Label



func _ready():
	$"..".visible = false
	
	


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
	
func voiceline():
	var choice = randi_range(1,25)
	if choice == 1:
		showText("Lel Paso: Attaboy", 0, 1)
		$"../AudioStreamPlayer".play()
	elif choice == 2:
		showText("Lel Paso: Agh", 0, 1)
		$"../AudioStreamPlayer2".play()
	elif choice == 3:
		showText("Lel Paso: Ugh", 0, 1)
		$"../AudioStreamPlayer3".play()
	elif choice == 4:
		showText("Lel Paso: Hup", 0, 1)
		$"../AudioStreamPlayer4".play()
	elif choice == 5:
		showText("Lel Paso: Go on, get them!", 0, 2)
		$"../AudioStreamPlayer5".play()
	elif choice == 6:
		showText("Lel Paso: Come back ere!", 0, 1)
		$"../AudioStreamPlayer6".play()
	elif choice == 7:
		showText("Lel Paso: You cant just go swinging around your lasso at anyone.", 0, 2.5)
		$"../AudioStreamPlayer7".play()
	elif choice == 8:
		showText("Lel Paso: Remember, throw your lasso at the sheep!", 0, 2.5)
		$"../AudioStreamPlayer8".play()
	elif choice == 9:
		showText("Lel Paso: Heheh, I dont see he saw that comin.", 0, 3)
		$"../AudioStreamPlayer9".play()
	elif choice == 10:
		showText("Lel Paso: CRIKEY!", 0, 1)
		$"../AudioStreamPlayer10".play()
	elif choice == 11:
		showText("Lel Paso: Woahey!", 0, 1)
		$"../AudioStreamPlayer11".play()
	elif choice == 12:
		showText("Lel Paso: Woop woop hahah!", 0, 2)
		$"../AudioStreamPlayer12".play()
	elif choice == 13:
		showText("Lel Paso: Heheheh, come to papi.", 0, 2)
		$"../AudioStreamPlayer13".play()
	elif choice == 14:
		showText("Lel Paso: Youll make a good dinner.", 0, 1.5)
		$"../AudioStreamPlayer14".play()
	elif choice == 15:
		showText("Lel Paso: Come here sheepie sheepie.", 0, 2)
		$"../AudioStreamPlayer15".play()
	elif choice == 16:
		showText("Lel Paso: Come here big fluff", 0, 1)
		$"../AudioStreamPlayer16".play()
	elif choice == 17:
		showText("Master: Its flying off the shelves!", 1, 2)
		$"../AudioStreamPlayer17".play()
	elif choice == 18:
		showText("Master: Have you seen any of those baa baa black sheep, heheheh.", 1, 5)
		$"../AudioStreamPlayer18".play()
	elif choice == 19:
		showText("Master: Any wools good wool", 1, 1.5)
		$"../AudioStreamPlayer19".play()
	elif choice == 20:
		showText("Master: We're overflowing with fluff!", 1, 2)
		$"../AudioStreamPlayer20".play()
	elif choice == 21:
		showText("Master: Keep making sure you get those golden sheep for me buddy", 1, 3.5)
		$"../AudioStreamPlayer21".play()
	elif choice == 22:
		showText("Master: Camon!", 1, 1)
		$"../AudioStreamPlayer22".play()
	elif choice == 23:
		showText("Master: Keep it up little buddy!", 1, 2)
		$"../AudioStreamPlayer23".play()
	elif choice == 24:
		showText("Master: And I mean if you see any of those white ones on your way around, just lasso them if you will", 1, 6)
		$"../AudioStreamPlayer24".play()
	elif choice == 25:
		showText("Master: We're raking in the dough!", 1, 2)
		$"../AudioStreamPlayer25".play()
