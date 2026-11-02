extends CharacterBody2D

const SPEED = 150.0
var cut = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity += get_gravity() * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if(position.y > 1000):
		if(cut == 1):
			velocity.y=0
			respawn()
	
func respawn():
	position.y=-50
	position.x = randi_range(-180,220)
