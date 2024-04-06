class_name Boost extends Behaviour

@export var direction: DirectionalInput
@export var body: CharacterBody2D

@export var boost_amount: float
@export var boost_delay: int

@onready var last_boost = Time.get_ticks_msec()

signal boosted

func boost_delayed():
	var now = Time.get_ticks_msec()
	if now - last_boost < boost_delay: return

	boost()

	last_boost = now

func boost():
	body.velocity += direction.value * boost_amount
	boosted.emit()

