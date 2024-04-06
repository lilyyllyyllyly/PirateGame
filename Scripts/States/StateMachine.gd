class_name StateMachine extends Node

var state: State:
	set(value):
		if state == value: return

		# disable last state behaviours
		if state:
			for b: Behaviour in state.behaviours:
				b.enabled = false

		state = value

		# enable new state behaviours
		for b: Behaviour in state.behaviours:
			b.enabled = true

func _ready():
	for b: Behaviour in state.behaviours:
		b.enabled = true

