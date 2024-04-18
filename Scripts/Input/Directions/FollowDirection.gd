class_name FollowDirection extends DirectionalInput

@export var object: Node2D
@export var target: Node2D

func get_value():
	if target: return (target.position - object.position).normalized()
	else: return Vector2(0, 0)

