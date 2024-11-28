class_name LineColliderUpdate extends Node

@export var collision: CollisionShape2D
@export var line: Line2D

@onready var line_res = collision.shape as SegmentShape2D

func _ready():
	line_res.a = line.points[0]
	line_res.b = line.points[line.points.size()-1]

