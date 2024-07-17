class_name InteractSignal extends Node

@export var player_res: NodeResource
@export var player_has_to_collide: bool = true

var player: CharacterBody2D
var player_inside = false

signal interact_pressed

func _ready():
	await get_tree().process_frame
	player = get_node(player_res.value) as CharacterBody2D

func on_player_entered(_body):
	player_inside = true

func on_player_exit(_body):
	player_inside = false

func _process(_delta):
	if !is_instance_valid(player): return
	if !player.is_on_floor: return
	if player_has_to_collide and !player_inside: return
	if Input.is_action_just_pressed("up"): interact_pressed.emit()

