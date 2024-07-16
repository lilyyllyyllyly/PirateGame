class_name TreasureChest extends Node

@export var player_res: NodeResource
@export var player_bandana_res: BoolResource
@export var interact_signal: InteractSignal
@export var anim: AnimationPlayer
@export var particles: CPUParticles2D
@export var player_pos: Node2D

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

	# open chest
	open = true
	anim.play("open" if !player_bandana_res.value else "open-bandana")

	# hide, position and freeze player
	var player = get_node(player_res.value)
	player.velocity = Vector2(0,0)
	player.global_position = player_pos.global_position
	player.hide()
	player.process_mode = Node.PROCESS_MODE_DISABLED

func on_animation_finished(anim_name):
	if anim_name != "open" and anim_name != "open-bandana": return

	# play opened animation
	anim.play("stay-open")

	# show and unfreeze player
	var player = get_node(player_res.value)
	player.show()
	player.process_mode = Node.PROCESS_MODE_INHERIT

func on_opened():
	particles.emitting = true

