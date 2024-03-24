class_name PathInput extends GenericInput

@export var fish: Node2D
@export var path: PathResource
@export var dist_threshold: float
var curr_point = 0

func get_direction():
	if fish.position.distance_to(path.points[curr_point]) <= dist_threshold:
		curr_point = (curr_point + 1) % path.points.size()

	return (path.points[curr_point] - fish.position).normalized()

