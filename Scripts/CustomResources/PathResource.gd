@tool
class_name PathResource extends Resource

@export var points : PackedVector2Array:
	set(value):
		if points != value:
			points = value
			emit_changed()

func _init(p_points = []):
	points = p_points

