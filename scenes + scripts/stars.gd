extends Sprite2D

var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	var temp = fmod(timer,5)/5
	if temp > 0.5:
		temp = 1-temp
	modulate.a = temp
	pass
