class_name State extends Behaviour

@export var behaviours: Array[Behaviour]

func _on_enable():
	for b: Behaviour in behaviours:
		b.enabled = true

	super()

func _on_disable():
	for b: Behaviour in behaviours:
		b.enabled = false

	super()

