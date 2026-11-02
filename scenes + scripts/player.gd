extends CharacterBody2D

signal bob
var jumps = 0
const SPEED = 150.0
const JUMP_VELOCITY = -200.0
var cut = 0

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
		jumps+=1
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
