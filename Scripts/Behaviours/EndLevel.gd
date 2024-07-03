class_name EndLevel extends Node2D

@export var camera: CameraFollow
@export var player: Node2D
@export var bot_spr: AnimatedSprite2D
@export var top_spr: Sprite2D

@export_group("End UI")
@export var gem_text: Label

var gem_total = 0

func _ready():
	await get_tree().process_frame
	gem_total = len(get_tree().get_nodes_in_group("Gems"))

func on_player_entered():
	# changing camera target
	camera.set_target(get_path())
	camera.move_speed = 0
	camera.deadzone.position.x = camera.min_deadzone_x

	# disabling player
	player.queue_free()

	# starting boat animation
	bot_spr.play("rowing")
	top_spr.hide()

	# counting gems
	var remaining_gems = len(get_tree().get_nodes_in_group("Gems"))
	gem_text.text = "Gems: %d/%d" % [gem_total - remaining_gems, gem_total]

