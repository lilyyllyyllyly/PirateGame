class_name PlaneMovement extends MovementCalculator

@export var direction: DirectionalInput

@export var body: CharacterBody2D

@export var speed: float
@export var accel: float

func calculate_movement(delta):
	var move = body.velocity
	var now = Time.get_ticks_msec()

	var goal_vel = direction.value * speed
	move += (goal_vel - move).limit_length(accel * delta)

	return move

