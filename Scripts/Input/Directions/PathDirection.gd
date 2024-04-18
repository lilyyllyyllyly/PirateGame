class_name PathDirection extends DirectionalInput

@export var object: Node2D

@export  var path_visualizer: PathVisualizer
@onready var path = path_visualizer.path

@export var dist_threshold: float = 5
var curr_point = 0

func get_value():
	if object.position.distance_to(path.points[curr_point]) <= dist_threshold:
		curr_point = (curr_point + 1) % path.points.size()

	return (path.points[curr_point] - object.position).normalized()

