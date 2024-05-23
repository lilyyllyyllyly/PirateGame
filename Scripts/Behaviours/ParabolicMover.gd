class_name ParabolicMover extends Behaviour

@export var obj: Node2D

@export var height: float
@export var dist: float

@onready var start_pos = obj.position
@onready var end_pos = start_pos.x + dist

func _process(delta):
	var x = (obj.position.x - start_pos.x) / (end_pos - start_pos.x)

	# parabola from funtion f(x) = a(2x - 1)² - a
	obj.position.y = start_pos.y + height * pow((2*x - 1), 2) - height

