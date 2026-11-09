extends CharacterBody2D

const SPEED = 20.0
var cut = 0
var start = 0
var timer = 0.0
var shield = 0

func _physics_process(delta: float) -> void:
	if(start == 1):
		timer += delta
	#print(shield)
	rotate(deg_to_rad(-45)*delta)
	velocity += get_gravity() * delta * 0.02

	move_and_slide()
	velocity.x =0
	if(position.y > 1000):
		if(cut == 1):
			if(start == 1):
				if(timer > randi_range(1,2)):
					if (shield == 0):
						print(velocity.y + delta)
						velocity.y=0
						respawn()
					timer = 0
	
func respawn():
	visible = true
	$Sprite2D.visible = true
	rotation = 0
	position.y=-50
	position.x = randi_range(-180,220)
	rotate(deg_to_rad(randi_range(-50, 40)))
	position.y=-100
