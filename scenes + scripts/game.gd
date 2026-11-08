extends Node2D

var timer = 0.0
var active = 0
var active2 = 1
var active3 = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$cutscene.visible = true
	$damage.damage.connect(end_game)
	$debris/damage.damage.connect(end_game)
	$"spikes ;3"/damage.damage.connect(end_game)
	$cutscene/AnimatedSprite2D.bob2.connect(cutscene_end)
	$player.bob.connect(start)
	$endscreen.restart.connect(restart_game)
	$endcut/endcut_ani.visible = false
	$endcut/endcut_backg.visible = false

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
	active2 = 0
	if $score.score < 111:#111:
		$endscreen.visible = true
		$score/Label.label_settings.font_size=40
	else:
		if active3==0:
			active3 = 1
			$endcut/endcut_ani.visible = true
			$endcut/endcut_backg.visible = true
			$endcut/endcut_ani.frame = 0
			$endcut/endcut_ani.timer = 0
			$endcut/endcut_ani.score = $score.score
			$score/Label.visible = false
		
	
func cutscene_end():
	$debris.cut = 1
	$"spikes ;3".cut = 1
	$player.cut=1
	$cutscene/Sprite2D.visible = false
	$cutscene/Label.visible = false

func start():
	$debris.start = 1
	$"spikes ;3".start = 1
	active = 1
	
func restart_game():
	#print("you gotta reload for now")
	cutscene_end()
	$debris.start = 0
	$"spikes ;3".start = 0
	$endscreen.visible = false
	$player.jumps=0
	$score/Label.label_settings.font_size=20
	$score.score=0
	active2 = 1
	active=0
	$player.position.x=0
	$player.position.y=-13
