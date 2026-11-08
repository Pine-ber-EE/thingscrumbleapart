extends CharacterBody2D

signal bob
var jumps = 0
const SPEED = 150.0
const JUMP_VELOCITY = -200.0
var cut = 0
var flap = 1
var timer = 0

func _physics_process(delta: float) -> void:
	if (jumps == 0):
		modulate.a = 0.5
	else:
		if (cut == 1):
			modulate.a = 1
			emit_signal("bob")
	# Add the gravity.
	if not is_on_floor():
		if not (jumps == 0):
			velocity += get_gravity() * delta * 0.6

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if (cut == 1):
			jumps+=1
			flap = 5
			velocity.y = JUMP_VELOCITY
	else:
		if !(jumps == 0):
			flap -= delta * 11

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if flap >= 1:
		$AnimatedSprite2D.play()
	#else:
		#if $AnimatedSprite2D.frame == 1:
			#$AnimatedSprite2D.pause()
