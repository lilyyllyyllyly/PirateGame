class_name Spawner extends Behaviour

@export var scene: PackedScene
@export var spawn_at: Node2D
@export var offset: Vector2
@export var child_of: Node

func spawn():
	var new = scene.instantiate()
	if is_instance_valid(child_of):
		child_of.add_child(new)
	else:
		get_tree().current_scene.add_child(new)

	if !(new is Node2D): return new
	new.global_position = spawn_at.global_position + offset

	return new

