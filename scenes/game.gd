extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$damage.bob.connect(end_game)
	$debris/damage.bob.connect(end_game)
	$cutscene/AnimatedSprite2D.bob2.connect(cutscene_end)
	$player.bob.connect(start)
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not $player.jumps==0:
		$pressspace.visible = false
	
func end_game():
	print("hello")
	$endscreen.visible = true
	
func cutscene_end():
	$debris.cut = 1
	$cutscene/Sprite2D.visible = false

func start():
	$debris.start = 1
	#$damage.start += 1
