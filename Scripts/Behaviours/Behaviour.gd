class_name Behaviour extends Node

signal on_enable
signal on_disable

@export var enabled: bool = true:
	set(value):
		enabled = value
		if (enabled): _on_enable()
		else: _on_disable()

func _on_enable():
	on_enable.emit()
	process_mode = Node.PROCESS_MODE_INHERIT

func _on_disable():
	on_disable.emit()
	process_mode = Node.PROCESS_MODE_DISABLED

func _ready():
	if enabled: _on_enable()

