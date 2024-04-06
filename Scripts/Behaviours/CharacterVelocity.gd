class_name CharacterVelocity extends Behaviour

@export var body: CharacterBody2D
@export var move: MovementCalculator

func _physics_process(delta):
	body.velocity = move.calculate_movement(delta)

