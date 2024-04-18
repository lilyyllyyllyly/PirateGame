class_name SceneManager extends Node

func reload_scene():
	get_tree().reload_current_scene.call_deferred()

