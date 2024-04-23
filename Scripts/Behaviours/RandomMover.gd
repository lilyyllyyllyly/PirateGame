class_name RandomMover extends Behaviour

@export var object: Node2D
@export var area: Rect2

func reposition():
	object.position = Vector2(randf_range(area.position.x, area.end.x), randf_range(area.position.y, area.end.y))

