extends AnimatedSprite2D

const test = "hello"
var timer = 0
signal bob2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a=1
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	timer += delta * 0.4
	frame = round(timer)
	modulate.a = fmod(timer+0.5,1)+0.4
	if frame == 5:
		emit_signal("bob2")
		visible = false
