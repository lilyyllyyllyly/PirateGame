class_name HorizontalMovement extends MovementCalculator

@export var direction: DirectionalInput

@export var body: CharacterBody2D

@export var speed: float
@export var accel: float

func calculate_movement(delta):
	var move = body.velocity

	var goal_vel = direction.value.x * speed

	var max_move = accel * delta
	if goal_vel != 0 and sign(goal_vel) != sign(move.x):
		# braking (accelerate faster if moving against current direction)
		max_move *= 2

	move.x += clamp(goal_vel - move.x, -max_move, max_move)

	return move

