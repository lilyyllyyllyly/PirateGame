class_name GroundMovement extends MovementCalculator

@export var body_path:	NodePath
@onready var body = get_node(body_path) as CharacterBody2D

@export_group("Horizontal movement")
@export var ground_speed:	float
@export var ground_accel:	float

@export_group("Jump")
@export var jump_force:	float
@export var jump_hold:	float

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var jump_start = 0
var jumping = false

func calculate_movement(delta):
	var move = body.velocity
	var now = Time.get_ticks_msec()

	# vertical
	# - gravity
	if not body.is_on_floor():
		move.y += gravity * delta

	# - jump
	if body.is_on_floor() or (jumping and not input.jump_held): jumping = false

	if input.jump_held and (body.is_on_floor() or jumping):
		move.y = jump_force

		if not jumping:
			jumping = true
			jump_start = now
		elif now - jump_start > jump_hold:
			jumping = false
	# ---

	# horizontal
	var goal_vel = input.direction.x * ground_speed

	var max_move = ground_accel * delta
	if goal_vel != 0 and sign(goal_vel) != sign(move.x):
		# braking (accelerate faster if moving against current direction)
		max_move *= 2

	move.x += clamp(goal_vel - move.x, -max_move, max_move)
	# ---

	return move

