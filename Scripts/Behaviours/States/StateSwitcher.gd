class_name StateSwitcher extends Behaviour

@export var state_machine: StateMachine
@export var new_state: State

signal switched

func switch():
	state_machine.state = new_state
	switched.emit()
