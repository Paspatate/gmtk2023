extends Sprite2D

var x : int = 0
var speed : float = PI
var offset_animation : float = 0

func get_offset_animation():
	return offset_animation
	
func _process(delta):
	x += speed
	if x > 2 * PI:
		x -= 2 * PI
		
	offset_animation = sin(PI/2 * delta * x) + 1
	
	
