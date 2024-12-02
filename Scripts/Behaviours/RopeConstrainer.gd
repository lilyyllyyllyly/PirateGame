class_name RopeConstrainer extends Behaviour

@export var body: CharacterBody2D
@export var y_offset: float
@export var rope: Line2D

func set_rope_from_collider(collider: Object):
	rope = (collider as Node).get_node("../Line2D") # bad again

func _on_enable():
	super()
	body.velocity.y = 0

func _process(_delta):
	if !is_instance_valid(rope): return

	var left_point  = Vector2(0, 0)
	var right_point = Vector2(0, 0)

	if rope.points[0].x > rope.points[rope.points.size()-1].x:
		left_point = rope.points[rope.points.size()-1]
		right_point = rope.points[0]
	else:
		left_point = rope.points[0]
		right_point = rope.points[rope.points.size()-1]

	left_point += rope.global_position
	right_point += rope.global_position

	body.global_position.x = clamp(body.global_position.x, left_point.x, right_point.x)

	var t = (body.global_position.x - left_point.x) / (right_point.x - left_point.x)
	body.global_position.y = (right_point.y - left_point.y) * t + left_point.y + y_offset

