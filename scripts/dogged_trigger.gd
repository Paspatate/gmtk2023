extends Area2D

signal dogged

func _on_body_entered(body):
	if body.get_name() == "Player":
		dogged.emit()
