class_name Gravity extends Behaviour

@export var body: CharacterBody2D
@export var term_vel: float = 200

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if body and (not body.is_on_floor()) and (body.velocity.y < term_vel):
		body.velocity.y += gravity * delta

