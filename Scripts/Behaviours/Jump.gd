class_name Jump extends Behaviour

@export var jump_held: ConditionalInput

@export var body: CharacterBody2D

@export var jump_force:	float
@export var jump_hold:	int

var jump_start = 0
var jumping = false

func _physics_process(_delta):
	var now = Time.get_ticks_msec()

	if body.is_on_floor() or (jumping and not jump_held.value): jumping = false

	if jump_held.value and (body.is_on_floor() or jumping):
		body.velocity.y = jump_force

		if not jumping:
			jumping = true
			jump_start = now
		elif now - jump_start > jump_hold:
			jumping = false

