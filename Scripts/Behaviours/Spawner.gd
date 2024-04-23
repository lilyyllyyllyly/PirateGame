class_name Spawner extends Behaviour

@export var scene: PackedScene
@export var spawn_at: Node2D
@export var offset: Vector2
@export var child_of: Node2D

func spawn():
	var new = scene.instantiate()
	child_of.add_child(new)

	if !(new is Node2D): return
	new.global_position = spawn_at.global_position + offset

