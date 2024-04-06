class_name PlayerState extends StateMachine

@export var ground_state: State
@export var water_state:  State

func _ready():
	state = ground_state
	super()

func on_water_entered(_area):
	state = water_state

func on_water_exited(_area):
	state = ground_state

