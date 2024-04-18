class_name StateMachine extends Node

@export var state: State:
	set(value):
		if state == value: return

		if state:
			state.enabled = false

		state = value

		state.enabled = true

func _ready():
	if state: state.enabled = true

