extends Node2D

signal loose
var _children : Array[Node]
var _children_max_index : int = -1
var _selected_index : int = 0
var _cursor_scene = preload("res://scenes/cursor_arrow.tscn")
var _cursor
const CURSOR_OFFSET : float = 48

func _place_cursor():
	var _child : Node = _children[_selected_index]
	_cursor.position = _child.position + Vector2.UP * (CURSOR_OFFSET + _cursor.get_offset_animation())
	
func _create_cursor():
	_cursor = _cursor_scene.instantiate()
	self.add_child(_cursor)
	
func _ready():
	for _i in self.get_children():
		_children.append(_i)
		_children_max_index += 1
	_create_cursor()
	_children[_selected_index].set_active()
	
		
func _next_child():
	if _selected_index >= _children_max_index:
		loose.emit()
	else:
		_children[_selected_index].set_inactive()
		_selected_index += 1
		_children[_selected_index].set_active()
		_place_cursor()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_place_cursor()


func _on_dogged_trigger_dogged():
	_next_child()
