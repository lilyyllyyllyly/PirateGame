class_name Mover extends CharacterBody2D

@export  var move_path: NodePath
@onready var move = get_node(move_path) as MovementCalculator

func _physics_process(delta):
	velocity = move.calculate_movement(delta)
	move_and_slide()

