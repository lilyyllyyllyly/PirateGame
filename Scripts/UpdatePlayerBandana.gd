class_name UpdatePlayerBandana extends Node

@export var player_bandana_res: BoolResource

func on_health_changed(old_value, new_value):
	player_bandana_res.value = new_value > 1

