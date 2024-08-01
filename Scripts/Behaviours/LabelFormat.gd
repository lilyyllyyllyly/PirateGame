class_name LabelFormat extends Behaviour

@export var label: Label
@onready var template = label.text

func replace(value):
	label.text = template % value

