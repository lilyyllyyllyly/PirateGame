class_name StateSwitcher extends Node

@export var states: Array[State]
@export var curr_state: int:
	set(value):
		if curr_state == value: return

		# disable last state behaviours
		for b: Behaviour in states[curr_state].behaviours:
			b.enabled = false

		curr_state = value

		# enable new state behaviours
		for b: Behaviour in states[curr_state].behaviours:
			b.enabled = true

func _ready():
	for i in states.size():
		for b: Behaviour in states[i].behaviours:
			b.enabled = (i == curr_state)

func next_state():
	curr_state = (curr_state + 1) % states.size()

