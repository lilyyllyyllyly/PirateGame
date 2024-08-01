class_name SaveCheckSignal extends Node

@export var save: SaveResource
@export var default_key: String = ""

signal on_true
signal on_false

func check(key: String = default_key, value = true):
	if save.data.has(key) and save.data[key] == value:
		on_true.emit()
	else:
		on_false.emit()

