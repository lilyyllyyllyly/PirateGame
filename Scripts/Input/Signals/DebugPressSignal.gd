class_name DebugPressSignal extends Node

signal debug_pressed

func _process(_delta):
	if Input.is_action_just_pressed("debug"): debug_pressed.emit()

