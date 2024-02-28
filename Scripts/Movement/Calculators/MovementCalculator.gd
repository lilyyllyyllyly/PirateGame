class_name MovementCalculator extends Node

@export  var input_path: NodePath
@onready var input = get_node(input_path) as GenericInput

func calculate_movement(_delta): pass

