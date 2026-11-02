extends Node2D

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = "score: 0"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = "score: "+str(score)
