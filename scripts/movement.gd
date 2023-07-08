extends CharacterBody2D
class_name Player

signal death
signal jump

@export var max_speed = 350
@export var acceleration : float = 70
@export var jump_strength : float = 630
@export var gravity = 2500;

var direction = 1

func _physics_process(delta):
	var direction_vec = choose_direction()
	
	velocity.x = direction_vec.x * max_speed
	velocity.y += gravity * delta
	
	move_and_slide()
	
func do_jump():
	if is_on_floor():
		velocity.y = -jump_strength
	

func choose_direction() -> Vector2:
	return Vector2.RIGHT * direction

func reverse_direction():
	direction = -direction
	$PlayerAnimation.flip_h = not $PlayerAnimation.flip_h

func _on_death():
	print("PLAYER DEAD")


func _on_jump():
	do_jump()

func _on_movement_trigger_area_entered(area):
	if area is JumpTrigger:
		do_jump()
		print("player jumped")
	elif area is DirectionTrigger:
		reverse_direction()
		print("reverse the direction")
		
