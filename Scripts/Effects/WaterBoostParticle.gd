class_name WaterBoostParticle extends Node

@export var direction: DirectionalInput
@export var player: Node2D

@export var boost_effect: PackedScene
@export var rot_offset: float

func spawn_particle():
	var new_effect = boost_effect.instantiate()
	new_effect.rotation = atan2(-direction.value.y, -direction.value.x) + rot_offset
	new_effect.position = player.position
	get_tree().current_scene.add_child(new_effect)

