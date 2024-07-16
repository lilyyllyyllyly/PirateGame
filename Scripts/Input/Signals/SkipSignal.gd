class_name SkipSignal extends Node

signal skipped

func _process(_delta):
	if Input.is_action_pressed("skip"): skipped.emit()

