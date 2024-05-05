class_name SceneChanger extends Node

@export_file var change_to

func change():
	get_tree().change_scene_to_file.call_deferred(change_to)

