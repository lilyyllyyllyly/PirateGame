class_name Thrower extends Node

@export var body: CharacterBody2D
@export var intensity: float

func throw(direction: Vector2, add: bool = false):
	body.velocity = (body.velocity * int(add)) + direction * intensity

func throw_away_from(from: Node2D, add: bool = false):
	var dist = from.global_position - body.global_position
	var heading = -dist.normalized()
	throw(heading, add)

func throw_towards(toward: Node2D, add: bool = false):
	var dist = toward.global_position - body.global_position
	var heading = dist.normalized()
	throw(heading, add)

