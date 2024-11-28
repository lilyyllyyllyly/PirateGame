class_name RaycastVelocity extends RayCast2D

signal collision_enter
signal collision_exit

enum Axis {BOTH, X_AXIS, Y_AXIS}

@export var body: CharacterBody2D
@export var axis: Axis
@export var positive_only = false # shouldnt be here, its just for the rope, but i cant be asked

var collided_last_frame = false

func _process(delta):
	if   axis == Axis.BOTH:
		target_position = body.velocity * delta
	elif axis == Axis.X_AXIS:
		target_position = body.velocity * delta * Vector2(1, 0)
	elif axis == Axis.Y_AXIS:
		target_position = body.velocity * delta * Vector2(0, 1)

	if positive_only:
		if target_position.x < 0: target_position.x = 0
		if target_position.y < 0: target_position.y = 0

	force_raycast_update()

	if   !collided_last_frame &&  is_colliding(): collision_enter.emit()
	elif  collided_last_frame && !is_colliding(): collision_exit.emit()

	collided_last_frame = is_colliding()

