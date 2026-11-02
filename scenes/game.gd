extends Node2D


var timer = 0.0
var active = 0
var active2 = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$damage.bob.connect(end_game)
	$debris/damage.bob.connect(end_game)
	$"spikes ;3"/damage.bob.connect(end_game)
	$cutscene/AnimatedSprite2D.bob2.connect(cutscene_end)
	$player.bob.connect(start)
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if(timer>1):
		timer-=1
		if(active == 1):
			if(active2 == 1):
				$score.score += 1
	
	if not $player.jumps==0:
		$pressspace.visible = false
	
func end_game():
	print("hello")
	$endscreen.visible = true
	active2 = 0
	
func cutscene_end():
	$debris.cut = 1
	$"spikes ;3".cut = 1
	$player.cut=1
	$cutscene/Sprite2D.visible = false

func start():
	$debris.start = 1
	$"spikes ;3".start = 1
	active = 1
	#$damage.start += 1
