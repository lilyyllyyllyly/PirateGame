# just the existance of this script is pretty dumb
class_name TreeExitSignal extends Node

signal node_exiting

@export var node: Node

func set_node(new_node: Node):
	if !is_instance_valid(new_node): return

	if is_instance_valid(node):
		node.tree_exiting.disconnect(emit_node_exiting)

	new_node.tree_exiting.connect(emit_node_exiting)

func _ready():
	if is_instance_valid(node): node.tree_exiting.connect(emit_node_exiting)

# this is even dumber
func emit_node_exiting():
	node_exiting.emit()

