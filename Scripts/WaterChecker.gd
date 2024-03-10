extends Area2D

@export  var mover_path:	NodePath
@onready var mover = get_node(mover_path) as Mover

@export  var animator_path:	NodePath
@onready var animator = get_node(animator_path) as PlayerAnimation

@export  var ground_move_path:	NodePath
@onready var ground_move = get_node(ground_move_path) as MovementCalculator

@export  var water_move_path:	NodePath
@onready var water_move  = get_node(water_move_path)  as MovementCalculator

func on_area_entered(_area):
	mover.move = water_move
	animator.in_water = true

func on_area_exited(_area):
	mover.move = ground_move
	animator.in_water = false

