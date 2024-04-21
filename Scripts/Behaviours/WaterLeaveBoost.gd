class_name WaterLeaveBoost extends Behaviour

@export var body: CharacterBody2D
@export var water_move: PlaneMovement

signal should_boost

func on_water_exited():
	if body.velocity.length() > water_move.speed:
		should_boost.emit()

