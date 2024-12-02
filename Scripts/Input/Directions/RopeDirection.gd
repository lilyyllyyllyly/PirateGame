class_name RopeDirection extends DirectionalInput

@export var rope: Line2D

func set_rope_from_collider(collider: Object):
	rope = (collider as Node).get_node("../Line2D") # bad

func get_value():
	if !is_instance_valid(rope): return Vector2(0, 0)

	var left_point  = Vector2(0, 0)
	var right_point = Vector2(0, 0)

	if rope.points[0].x > rope.points[rope.points.size()-1].x:
		left_point = rope.points[rope.points.size()-1]
		right_point = rope.points[0]
	else:
		left_point = rope.points[0]
		right_point = rope.points[rope.points.size()-1]

	return (right_point - left_point).normalized() * Input.get_axis("left", "right")

