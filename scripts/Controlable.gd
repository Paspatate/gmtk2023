extends CharacterBody2D

signal disable

@export var max_speed = 350
@export var acceleration : float = 70
@export var jump_strength : float = 630
@export var gravity = 2500;

#var _pid = Pid2D.new(100.0, 2, 2.5)
@export var sprite : Texture2D

var active = true

func _ready():
	if not sprite == null:
		$Sprite2D.texture = sprite
	


func _physics_process(delta):
	if not active:
		return
		
	var direction : Vector2 = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		0
	)
	
	velocity.x += direction.x * acceleration
	velocity.y += gravity * delta
	
	if direction.x == 0:
		velocity.x = lerp(velocity.x, 0.0, 0.4)
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	
	var is_jumping = is_on_floor() and Input.is_action_just_pressed("jump")
	
	if is_jumping:
		velocity.y = -jump_strength
	
	move_and_slide()
	


func _on_disable():
	active = false
