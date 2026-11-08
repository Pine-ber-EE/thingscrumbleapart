extends Sprite2D

signal restart

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	
func _process(delta: float) -> void:
	if visible == true:
		if Input.is_action_just_pressed("ui_reset"):
			emit_signal("restart")
	
