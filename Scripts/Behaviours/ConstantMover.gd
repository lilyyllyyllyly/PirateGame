class_name ConstantMover extends Behaviour

@export var object: Node2D
@export var move: Vector2

func _physics_process(delta):
	if object:
		object.position += move * delta

func set_object(new_obj: Node2D):
	object = new_obj

func unset_object(old_obj: Node2D = null):
	if !old_obj or object == old_obj:
		object = null

