extends CharacterBody2D
class_name Player

signal death
signal jump

enum TrigType {
	DIRECTION,
	JUMP
}

@export var max_speed = 270
@export var acceleration : float = 70
@export var jump_strength : float = 630
@export var gravity = 2500;

var direction = 1
var action_queue: Array[TrigType] = []

func _ready():
	$PlayerAnimation.play("walk")

func _physics_process(delta):
	var direction_vec = choose_direction()
	
	velocity.x = direction_vec.x * max_speed
	velocity.y += gravity * delta
	
	for action_index in range(action_queue.size()):
		if action_queue[action_index] == TrigType.JUMP and is_on_floor():
			do_jump()
			action_queue.remove_at(action_index)
		elif action_queue[action_index] == TrigType.DIRECTION:
			reverse_direction()
			action_queue.remove_at(action_index)
		
		
	
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
		action_queue.append(TrigType.JUMP)
		print("added player jump to queue")
	elif area is DirectionTrigger:
		action_queue.append(TrigType.DIRECTION)
		print("added direction revese to queue")
		
