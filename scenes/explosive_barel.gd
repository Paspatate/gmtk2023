extends Area2D

var active = true
var _is_exploaded = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$ExplosionRadius.disabled = true


func _process(delta):
	if not active:
		return 
	if Input.is_action_just_pressed("interact") and not _is_exploaded:
		$ExplosionRadius.disabled = false
		$CPUParticles2D.restart()
		_is_exploaded = true


func _on_body_entered(body):
	print(body.name + " entered the radius")
	if body is Player:
		body.death.emit()
	

func set_active():
	active = true
