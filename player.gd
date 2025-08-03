extends CharacterBody3D

@export var speed = 3
@export var jumpspeed = 6
@export var fall_acceleration = 25
var attacking = false
var cardinal = "south"


var target_velocity = Vector3.ZERO
var direction = Vector3.ZERO
var vel = Vector2.ZERO
var pos = Vector2.ZERO


func _physics_process(delta):
	vel = Vector2(velocity.x, velocity.z)
	pos = Vector2(position.x, position.z)
	direction = Vector3.ZERO
	
	
	if not attacking:
		if Input.is_action_pressed("action"):
			attacking = true
			$AudioStreamPlayer.play()
			#velocity.x = 0
			#velocity.z = 0
			$Timer.start(1.6)
			if randi_range(1,8) <3:
				get_tree().call_group("voiceline", "voiceline")
			$attack.visible = true
			#$attack.rotation = direction
			$attack/CollisionShape3D.disabled = false
			$attack/AnimatedSprite3D.visible = false
			$attack/AnimatedSprite3D2.visible = false
			#$Pivot/AnimatedSprite3D.pause()
			#$Pivot/AnimatedSprite3D.set_frame_and_progress(0,0.0)
			$attack/AnimatedSprite3D.pause()
			$attack/AnimatedSprite3D.set_frame_and_progress(0,0.0)
			$attack/AnimatedSprite3D2.pause()
			$attack/AnimatedSprite3D2.set_frame_and_progress(0,0.0)
			if cardinal == "south":
				$attack.rotation.y = PI
				$attack/AnimatedSprite3D2.rotation.y = 0
				$attack/AnimatedSprite3D2.visible = true
				$attack/AnimatedSprite3D2.play("lasso north")
			elif cardinal == "southeast":
				$attack.rotation.y = -3*PI/4
				$attack/AnimatedSprite3D2.rotation.y = 0
				$attack/AnimatedSprite3D2.visible = true
				$attack/AnimatedSprite3D2.play("lasso north")
			elif cardinal == "east":
				$attack.rotation.y = -PI/2
				$attack/AnimatedSprite3D.visible = true
				$attack/AnimatedSprite3D.play("lasso east")
			elif cardinal == "northeast":
				$attack.rotation.y = -PI/4
				$attack/AnimatedSprite3D2.rotation.y = 0
				$attack/AnimatedSprite3D2.visible = true
				$attack/AnimatedSprite3D2.play("lasso north")
			elif cardinal == "north":
				$attack.rotation.y = 0
				$attack/AnimatedSprite3D2.rotation.y = 0
				$attack/AnimatedSprite3D2.visible = true
				$attack/AnimatedSprite3D2.play("lasso north")
			elif cardinal == "northwest":
				$attack.rotation.y = PI/4
				$attack/AnimatedSprite3D2.rotation.y = 0
				$attack/AnimatedSprite3D2.visible = true
				$attack/AnimatedSprite3D2.play("lasso north")
			elif cardinal == "west":
				$attack.rotation.y = PI/2
				$attack/AnimatedSprite3D2.rotation.y = PI/2
				$attack/AnimatedSprite3D.visible = true
				$attack/AnimatedSprite3D.play("lasso east")
			elif cardinal == "southwest":
				$attack.rotation.y = 3*PI/4
				$attack/AnimatedSprite3D2.rotation.y = 0	
				$attack/AnimatedSprite3D2.visible = true
				$attack/AnimatedSprite3D2.play("lasso north")
			print(cardinal)
			print($attack.rotation.y)
			
			
	
	

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.z += 1
	if Input.is_action_pressed("move_up"):
		direction.z -= 1
		
	if direction.x == 0 and direction.z == 0:
		#$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D.pause()
		$Pivot/AnimatedSprite3D.set_frame_and_progress(0,0.0)
	elif direction.x == 0 and direction.z == 1:
		$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D.play("south")
		cardinal = "south"
	elif direction.x == 1 and direction.z == 1:
		$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D.play("southeast")
		cardinal = "southeast"
	elif direction.x == 1 and direction.z == 0:
		$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D.play("east")
		cardinal = "east"
	elif direction.x == 1 and direction.z == -1:
		$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D.play("northeast")
		cardinal = "northeast"
	elif direction.x == 0 and direction.z == -1:
		$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D.play("north")
		cardinal = "north"
	elif direction.x == -1 and direction.z == -1:
		$Pivot/AnimatedSprite3D.rotation.y = PI
		$Pivot/AnimatedSprite3D.play("northeast")
		cardinal = "northwest"
	elif direction.x == -1 and direction.z == 0:
		$Pivot/AnimatedSprite3D.rotation.y = PI
		$Pivot/AnimatedSprite3D.play("east")
		cardinal = "west"
	elif direction.x == -1 and direction.z == 1:
		$Pivot/AnimatedSprite3D.rotation.y = PI
		$Pivot/AnimatedSprite3D.play("southeast")
		cardinal = "southwest"


	
	
	#if direction != Vector3.ZERO:
		#direction = direction.normalized()
	
	
	
	# Velocity on ground
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			target_velocity.y = jumpspeed
	
	# gravity
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	
	velocity = target_velocity
	Playerauto.playerposition = position
	move_and_slide()
	

	




func _on_timer_timeout():
	attacking = false
	$attack/CollisionShape3D.disabled = true
	$attack.visible = false
