class_name SkipSignal extends Node

signal skipped

func _process(_delta):
	if Input.is_action_just_pressed("skip"): skipped.emit()

