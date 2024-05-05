class_name SceneResetter extends Node

func reload_scene():
	get_tree().reload_current_scene.call_deferred()

