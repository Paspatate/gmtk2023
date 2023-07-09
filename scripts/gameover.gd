extends Control


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")


func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
