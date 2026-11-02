extends Area2D

signal bob

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		emit_signal("bob")
