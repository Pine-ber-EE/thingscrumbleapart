extends Node2D

var timer = 0.0
var active = 0
var active2 = 1
var active3 = 0
var shield = 1
var inv = 0
var shaketimer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$cutscene.visible = true
	$damage.damage.connect(end_game)
	$debris/damage.damage.connect(end_game)
	$"spikes ;3"/damage.damage.connect(end_game)
	
	$star/heal.heal.connect(gain_shield)
	$cutscene/AnimatedSprite2D.bob2.connect(cutscene_end)
	
	$player.bob.connect(start)
	$endscreen.restart.connect(restart_game)
	$endcut/endcut_ani.restart.connect(restart_game)
	
	$endcut/endcut_ani.visible = false
	$endcut/endcut_backg.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shield == 1:
		$player/particles.visible = true
	else:
		$player/particles.visible = false
	
	$star.shield = shield
	$star.active2 = active2
	
	timer += delta
	shaketimer += delta*20
	inv -= delta*5
	if(timer>1):
		timer-=1
		if(active == 1):
			if(active2 == 1):
				$score.score += 1
	
	if not $player.jumps==0:
		$pressspace.visible = false
	if shield == 0:
		$shield.visible = false
	else:
		$shield.visible = true
	if(shaketimer<1):
		$Camera2D.position = Vector2(3, -8)
	else: if(shaketimer<2):
		$Camera2D.position = Vector2(-2, -13)
	else: if(shaketimer<3):
		$Camera2D.position = Vector2(-1, -9)
	else: if(shaketimer<4):
		$Camera2D.position = Vector2(0, -11)
	else: if(shaketimer<5):
		$Camera2D.position = Vector2(0, -12)
	
func end_game():
	if active2 == 1:
		camera_shake()
	if shield == 0:
		if inv < 0:
			active2 = 0
			if $score.score < 30:#111:
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
	else:
		shield -= 1
		if $player.position.y > 90:
			end_game()
		else:
			inv = 5
		
	
	
func cutscene_end():
	$debris.cut = 1
	$"spikes ;3".cut = 1
	$player.cut=1
	$star.cut = 1
	$cutscene/Sprite2D.visible = false
	$cutscene/Label.visible = false

func start():
	$debris.start = 1
	$"spikes ;3".start = 1
	$star.start = 1
	active = 1
	
func restart_game():
	cutscene_end()
	$debris.start = 0
	$"spikes ;3".start = 0
	$endscreen.visible = false
	$endcut/endcut_ani.visible = false
	$endcut/endcut_backg.visible = false
	$player.jumps=0
	$player.flap = 1
	$score/Label.label_settings.font_size=20
	$score/Label.visible = true
	$score.score=0
	active2 = 1
	active3 = 0
	active=0
	$player.position.x=0
	$player.position.y=-13
	shield = 1

func camera_shake():
	shaketimer = 0
	
func gain_shield():
	$star/Sprite2D.visible = false
	if !(shield == 1):
		shield = 1
