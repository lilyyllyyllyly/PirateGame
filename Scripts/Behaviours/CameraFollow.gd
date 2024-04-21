class_name CameraFollow extends FollowNode

@export var direction: DirectionalInput
@export var min_deadzone_x: float
@export var max_deadzone_x: float
@export var move_speed: float

var flipped: bool = false

func _process(delta):
	super(delta)

	# moving deadzone as player walks
	deadzone.position.x = clamp(deadzone.position.x + -direction.value.x * move_speed * delta, min_deadzone_x, max_deadzone_x)

