extends Area2D

signal heal


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		emit_signal("heal")
