class_name CheckpointManager extends Node

@export var player: CharacterBody2D
@export var checkpoints: Array[Node2D]
var current = 0

func _process(delta):
	if current + 1 >= len(checkpoints) or current + 1 < 0: return

	if player.position.x > checkpoints[current + 1].position.x:
		current += 1

func respawn():
	if current >= len(checkpoints) or current < 0: return

	player.position = checkpoints[current].position
	player.velocity = Vector2(0, 0)

