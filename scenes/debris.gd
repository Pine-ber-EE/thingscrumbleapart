extends CharacterBody2D

const SPEED = 150.0
var cut = 0
var start = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity += get_gravity() * delta * 0.2


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if(position.y > 1000):
		if(cut == 1):
			if(start == 1):
				velocity.y=0
				respawn()
	
func respawn():
	rotation = 0
	position.y=-50
	position.x = randi_range(-180,220)
	rotate(deg_to_rad(randi_range(-40, 50)))
	position.y=-100
