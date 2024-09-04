class_name VelocityLimitSignal extends Node

@export var body: CharacterBody2D

@export var vel_limit: float
@export var low_limit: bool # if true, trigger signal when below vel_limit; otherwise trigger when above

signal passed_limit

@onready var old_vel = body.velocity.length()

func _process(_delta):
	var new_vel = body.velocity.length()

	if (low_limit and old_vel > vel_limit and new_vel <= vel_limit) or (!low_limit and old_vel < vel_limit and new_vel >= vel_limit):
		passed_limit.emit()

	old_vel = new_vel

