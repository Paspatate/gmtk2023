extends Node2D

@export var is_selected : bool = false
var is_up = false
var gfx : Sprite2D
var move_vector : Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	gfx = $"Spike GFX"
	var move_lenght = gfx.texture.get_height()
	move_vector = Vector2(0, move_lenght)

func move():
	if is_up:
		is_up = false
		translate(move_vector)
	else:
		is_up = true
		translate(-move_vector)

func check_movement():
	if Input.is_action_just_pressed("ui_accept"):
		print("lol")
		move()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_selected:
		check_movement()
