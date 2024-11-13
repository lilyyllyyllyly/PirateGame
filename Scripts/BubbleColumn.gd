class_name BubbleColumn extends Area2D

@export var direction = Vector2(0, 1)
@export var strength = 85

@export var mover: ConstantMover

func _ready():
	mover.move = direction.normalized() * strength

