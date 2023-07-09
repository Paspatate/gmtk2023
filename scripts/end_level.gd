extends Control


func _on_next_pressed():
	get_node("../Flag").emit_signal("load_next_level")
