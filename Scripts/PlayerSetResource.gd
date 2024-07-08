class_name PlayerSetResource extends Node

@export var player_res: NodeResource

func _ready():
	player_res.value = get_path()

