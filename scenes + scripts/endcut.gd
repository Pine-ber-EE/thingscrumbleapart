extends AnimatedSprite2D

var timer = 0
var score = 0
signal restart

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible == true:
		if Input.is_action_just_pressed("ui_reset"):
			emit_signal("restart")
	timer += delta * 0.3
	$Label.text = "score: "+str(score)
	if !(frame == 4):
		modulate.a = fmod(timer+0.5,1)+0.6
		frame = round(timer)
		$Label.visible = false
	else:
		modulate.a = 1
		$Label.visible = true
