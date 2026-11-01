extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$damage.bob.connect(end_game)
	$debris/damage.bob.connect(end_game)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not $player.jumps==0:
		$pressspace.visible = false;
	
func end_game():
	print("hello")
	$endscreen.visible = true
