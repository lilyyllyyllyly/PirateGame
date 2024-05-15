class_name SaveCheckSignal extends Node

@export var save: SaveResource

signal on_true
signal on_false

func check(key: String, value):
	if save.data.has(key) and save.data[key] == value:
		on_true.emit()
	else:
		on_false.emit()

