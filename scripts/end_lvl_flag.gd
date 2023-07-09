extends Area2D
class_name EndLvlFlag
signal load_next_level

@export var next_level_name : String
var next_level = preload("res://scenes/menu/end_level.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("wind")


func _on_area_entered(area):
	if area.name == "MovementTrigger":
		if next_level_name != "":
			var menu_next_lvl = next_level.instantiate()
			get_parent().add_child(menu_next_lvl)
			get_tree().paused = true
		else :
			get_tree().change_scene_to_file("res://scenes/menu/gameover.tscn")
			

func _on_load_next_level():
	get_tree().change_scene_to_file(next_level_name)
	get_tree().paused = false


func _on_player_death():
	get_tree().change_scene_to_file("res://scenes/menu/end_game.tscn")
