@tool
class_name WaveMover extends Behaviour

@export var run_on_editor: bool

@export var obj: Node2D

@export var amplitude: float
@export var frequency: float
@export var offset: float
@export var speed: float

func _process(delta):
	if Engine.is_editor_hint() and !run_on_editor: return
	obj.position.y = (sin(obj.global_position.x * frequency + Time.get_ticks_msec() / 1000.0 * speed + offset) + 1.0) / 2.0 * amplitude;

