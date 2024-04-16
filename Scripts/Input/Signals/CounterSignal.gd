class_name CounterSignal extends Node

@export var initial_value: int
@export var min: int
@export var max: int

signal depleted
signal filled

@onready var counter = initial_value:
	set(value):
		if counter == value: return

		counter = value

		if   counter >= max: filled.emit()
		elif counter <= min: depleted.emit()

func increment(value: int = 1):
	counter += value

func decrement(value: int = 1):
	counter -= value

func set_counter(value: int):
	counter = value

func reset():
	counter = initial_value

