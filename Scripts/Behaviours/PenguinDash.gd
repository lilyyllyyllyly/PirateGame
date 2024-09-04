class_name PenguinDash extends Behaviour

@export var thrower: Thrower
@export var player: NodeResource

func _on_enable():
	super()
	thrower.throw_towards(get_node(player.value))

