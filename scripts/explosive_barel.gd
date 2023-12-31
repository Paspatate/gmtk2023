extends Area2D

signal damage
var active = false
var _is_exploaded = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$ExplosionRadius.disabled = true


func _process(_delta):
	if not active:
		return 
	
	
	if Input.is_action_just_pressed("ui_accept") and not _is_exploaded:
		$ExplosionRadius.disabled = false
		$CPUParticles2D.restart()
		_is_exploaded = true
		self.visible = false
		set_inactive()


func _on_body_entered(body):
	if body.get_name() == "Player":
		body.damage(1)
	

func set_active():
	active = true

func set_inactive():
	active = false
