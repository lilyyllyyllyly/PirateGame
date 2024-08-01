class_name SaveValueSignal extends Node

@export var save: SaveResource
@export var default_key: String

signal pass_value(value)

func pass_from_key(key: String = default_key):
	if save.data.has(key): pass_value.emit(save.data[key])

