extends CharacterBody3D

@export var speed = 3
@export var jumpspeed = 6
@export var fall_acceleration = 25

var target_velocity = Vector3.ZERO
var direction = Vector3.ZERO
var vel = Vector2.ZERO
var pos = Vector2.ZERO


func _physics_process(delta):
	vel = Vector2(velocity.x, velocity.z)
	pos = Vector2(position.x, position.z)
	direction = Vector3.ZERO
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
	elif direction.x == 1 and direction.z == 1:
		$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D.play("southeast")
	elif direction.x == 1 and direction.z == 0:
		$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D.play("east")
	elif direction.x == 1 and direction.z == -1:
		$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D.play("northeast")
	elif direction.x == 0 and direction.z == -1:
		$Pivot/AnimatedSprite3D.rotation.y = 0
		$Pivot/AnimatedSprite3D.play("north")
	elif direction.x == -1 and direction.z == -1:
		$Pivot/AnimatedSprite3D.rotation.y = PI
		$Pivot/AnimatedSprite3D.play("northeast")
	elif direction.x == -1 and direction.z == 0:
		$Pivot/AnimatedSprite3D.rotation.y = PI
		$Pivot/AnimatedSprite3D.play("east")
	elif direction.x == -1 and direction.z == 1:
		$Pivot/AnimatedSprite3D.rotation.y = PI
		$Pivot/AnimatedSprite3D.play("southeast")
	
	
	
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
	move_and_slide()
