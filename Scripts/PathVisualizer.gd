@tool
class_name PathVisualizer extends Node2D

@export var path: PathResource:
	set(value):
		if path != value:
			path = value
			if path: path.changed.connect(on_path_changed)
			else: queue_redraw()

@export var color: Color = Color(0.0, 1.0, 0.0, 0.5):
	set(value):
		if color != value:
			color = value
			queue_redraw()

@export var width: float = 1.5:
	set(value):
		if width != value:
			width = value
			queue_redraw()

@export var show_on_runtime: bool = false:
	set(value):
		if show_on_runtime != value:
			show_on_runtime = value
			queue_redraw()

func on_path_changed():
	queue_redraw()

func _draw():
	if path and path.points.size() >= 2 and (show_on_runtime or Engine.is_editor_hint()):
		draw_polyline(path.points + PackedVector2Array([path.points[0]]), color, width)

