class_name EndLevel extends Node2D

@export var camera: CameraFollow
@export var player: Node2D

@export var boat_anim: AnimationPlayer

@export var map_anim: AnimationPlayer

@export var end_jingle: AudioStreamPlayer2D

@export_group("Gems Counter")
@export var gem_text: Label
@export var gem_delay_min: float
@export var gem_delay_max: float
@export var gem_delay_curve: Curve
@export var gem_audio: AudioStreamPlayer2D
@export var gem_audio_max_pitch: float
@export var woo_audio: AudioStreamPlayer2D

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
	boat_anim.play("rowing")

	# bring map down
	map_anim.play("drop")

	# start end jingle
	end_jingle.play()

func on_jingle_ended():
	# counting gems
	var remaining_gems = len(get_tree().get_nodes_in_group("Gems"))
	var collected_gems = gem_total - remaining_gems
	for i in range(1, collected_gems + 1):
		gem_text.text = "%d" % i

		gem_audio.play()
		gem_audio.pitch_scale = float(gem_audio_max_pitch * i - i)/collected_gems + 1

		var wait_time = (gem_delay_max - gem_delay_min) * gem_delay_curve.sample(float(i)/collected_gems) + gem_delay_min
		await get_tree().create_timer(wait_time).timeout
	
	gem_text.text = "%d/%d" % [collected_gems, gem_total]
	woo_audio.play()

	# counting open chests
	# TODO: open each chest in the map in order for the ones that were open
	print(len(get_tree().get_nodes_in_group("OpenChest")))

