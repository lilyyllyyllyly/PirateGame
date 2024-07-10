class_name CounterSignal extends Node

@export var initial_value: int
@export var minv: int
@export var maxv: int

signal depleted
signal filled
signal changed(old_value, new_value)

@onready var counter = initial_value:
	set(value):
		if counter == value: return

		changed.emit(counter, value)

		counter = value

		if   counter >= maxv: filled.emit()
		elif counter <= minv: depleted.emit()

func _ready():
	changed.emit(initial_value, counter)

func increment(value: int = 1):
	counter += value

func decrement(value: int = 1):
	counter -= value

func set_counter(value: int):
	counter = value

func reset():
	counter = initial_value

