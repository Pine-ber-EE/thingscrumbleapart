extends Area2D

signal bob
var start = 0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if start == 1:
			emit_signal("bob")
			print("haiii")
