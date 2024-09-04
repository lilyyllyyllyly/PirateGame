class_name HorizontalDrag extends MovementCalculator

@export var body: CharacterBody2D

@export var drag: float

func calculate_movement(delta):
	return body.velocity * (1 - drag * delta)

