extends CharacterBody2D

const SPEED = 80.0
var cut = 0
var start = 0
var timer = 0.0

func _physics_process(delta: float) -> void:
	if(start == 1):
		timer += delta
	rotate(deg_to_rad(45)*delta)
	velocity += get_gravity() * delta * 0.5

	move_and_slide()
	velocity.x =0
	if(position.y > 1000):
		if(cut == 1):
			if(start == 1):
				if(timer > randi_range(4,6)):
					velocity.y=0
					respawn()
					timer = 0
	
func respawn():
	rotation = 0
	position.y=-50
	position.x = randi_range(-180,220)
	rotate(deg_to_rad(randi_range(-40, 50)))
	position.y=-100
