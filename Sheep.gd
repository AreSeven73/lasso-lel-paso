extends CharacterBody3D


@export var speed = randi_range(1,6)
@export var accel = randi_range(1,4)
var boidsIsee := []
var possiblePositions := []
var trgt = Vector2.ZERO
var waitForTimer = false
var dir = Vector3.ZERO
var fall_acceleration = 25
var falling = false
var score = 100
var boosted = false




@onready var nav: NavigationAgent3D = $NavigationAgent3D






# the stupid physics stuff
func _physics_process(delta):
	
	if randi_range(1,10000) == 10:
		$AudioStreamPlayer3D.play()
	
	var direction = Vector2()
	
	if velocity.x > 0:
		$Pivot/AnimatedSprite3D.rotation.y = PI
		$Pivot/AnimatedSprite3D2.rotation.y = PI
	elif velocity.x < 0:
		$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D2.rotation.y = 0
	
	
	if not waitForTimer:
		waitForTimer = true
		$Timer.wait_time = randi_range(2,8)
		speed = randi_range(1,5)
		accel = randi_range(1,3)
		for i in range(-6, 6):
			for j in range(-3, 3):
				possiblePositions.append(Vector2(position.x+i, position.y+j))
		for boid in boidsIsee:
			if Vector2(boid.position.x, boid.position.z) in possiblePositions:
				possiblePositions.erase(Vector2(boid.position.x, boid.position.z))
		possiblePositions.erase(Vector2(position.x, position.z))
			
		trgt = possiblePositions.pick_random()
		
		nav.target_position = Vector3(trgt.x, 0, trgt.y)
		$Timer.start()
		
		
	dir = nav.get_next_path_position() - global_position
	
		
	direction = Vector2(dir.x, dir.z)
	
	if direction.length_squared() > 1.0:
		direction = direction.normalized()
	
	velocity = velocity.lerp(Vector3(direction.x, 0, direction.y) * speed, accel * delta)
	
	if not is_on_floor():
		velocity.y = velocity.y - (fall_acceleration * delta)
		if position.y < -1:
			print("I fell")
			get_tree().call_group("main", "spawnSheep")
			get_parent().remove_child(self)
		
	else:
		velocity.y = 0
		
	
	
	if velocity < Vector3(0.1,0,0.1) and velocity > Vector3(-0.1,0,-0.1):
		$Pivot/AnimatedSprite3D.play("default")
		$Pivot/AnimatedSprite3D2.play("default1")
	else:
		$Pivot/AnimatedSprite3D.play("new_animation")
		$Pivot/AnimatedSprite3D2.play("new_animation1")
	move_and_slide()
	
	
func _on_vision_body_entered(body):
	
	if body != self:
		boidsIsee.append(body)
	#if body.is_in_group("player"):
		#waitForTimer = false



func _on_vision_body_exited(body):
	if body:
		boidsIsee.erase(body)


func _on_timer_timeout():
	waitForTimer = false
	


func boostsheep():
	score += 1000
	print("BOOSTED")
	$Pivot/AnimatedSprite3D.visible = false
	$Pivot/AnimatedSprite3D2.visible = true
	boosted = true



func _on_hitbox_area_entered(area):
	if area.is_in_group("attack"):
		nav.target_position = Playerauto.playerposition
		$Timer3.start(1.3)


func _on_timer_3_timeout():
	print("Im caught")
	get_tree().call_group("main", "spawnSheep")
	Playerauto.score += score
	if boosted:
		get_tree().call_group("main", "extratime")
	print(Playerauto.score)
	get_parent().remove_child(self)
