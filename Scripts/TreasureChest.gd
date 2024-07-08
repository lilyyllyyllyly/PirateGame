class_name TreasureChest extends Node

@export var player_res: NodeResource
@export var interact_signal: InteractSignal
@export var sprite: AnimatedSprite2D

var player_colliding = false
var open = false

func _ready():
	await get_tree().process_frame
	interact_signal.player = get_node(player_res.value)

func on_player_entered(_body):
	player_colliding = true

func on_player_exit(_body):
	player_colliding = false

func on_interacted():
	if open or !player_colliding: return
	open = true

	add_to_group("OpenChest")
	sprite.play("open")

