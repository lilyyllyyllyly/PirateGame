class_name GenericInput extends Node

var direction: Vector2: get = get_direction
func get_direction(): return Vector2(0,0)

var jump_held: bool: get = get_jump_held
func get_jump_held(): return false

var jump_pressed: bool: get = get_jump_pressed
func get_jump_pressed(): return false

