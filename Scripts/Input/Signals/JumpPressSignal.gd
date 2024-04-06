class_name JumpPressSignal extends Node

signal jump_pressed

func _process(_delta):
	if Input.is_action_just_pressed("jump"): jump_pressed.emit()

