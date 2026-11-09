extends AnimatedSprite2D

const test = "hello"
var timer = 0
signal bob2
signal shake
var cutscene = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_skip"):
		emit_signal("bob2")
		visible = false
	timer += delta * 0.4
	frame = round(timer)
	modulate.a = fmod(timer+0.5,1)+0.3
	if frame == 8:
		emit_signal("bob2")
		visible = false
		cutscene =0
	if 5<=frame && cutscene == 1 && visible == true:
		emit_signal("shake")
