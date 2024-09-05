class_name FollowDirection extends DirectionalInput

@export var object: Node2D

@export var target: Node2D
@export var target_res: NodeResource

@export var offset: Vector2

enum AXIS {BOTH, X_AXIS, Y_AXIS}
@export var axis : AXIS = AXIS.BOTH

func _ready():
	target = target if target else get_node(target_res.value)

func get_value():
	if !target: return Vector2(0, 0)

	match axis:
		AXIS.BOTH:
			return (target.position - object.position - offset).normalized()
		AXIS.X_AXIS:
			return Vector2(sign(target.position.x - object.position.x - offset.x), 0)
		AXIS.Y_AXIS:
			return Vector2(0, sign(target.position.y - object.position.y - offset.y))

