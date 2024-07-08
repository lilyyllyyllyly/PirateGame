class_name InteractSignal extends Node

@export var player: CharacterBody2D

signal interact_pressed

func _process(_delta):
	if !player: return
	if !player.is_on_floor: return
	if Input.is_action_just_pressed("up"): interact_pressed.emit()

