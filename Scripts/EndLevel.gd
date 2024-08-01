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
@export var wait_after_gems: float

@export_group("Treasure Chests")
@export var chest_delay: float
@export var chests: Array[TreasureChest]
@export var ui_chests: Array[AnimationPlayer]

var ended = false

var gem_total = 0
var remaining_gems = 0
var collected_gems = 0
var gem_count_finished = false

signal counted_gems(gems)
signal finished

func _ready():
	await get_tree().process_frame
	gem_total = len(get_tree().get_nodes_in_group("Gems"))

func on_skipped():
	if !ended: return

	if !gem_count_finished:
		on_gem_count_finished()
		return
	
	finished.emit()

func on_player_entered():
	ended = true
	remaining_gems = len(get_tree().get_nodes_in_group("Gems"))
	collected_gems = gem_total - remaining_gems

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
	for i in range(1, collected_gems + 1):
		if gem_count_finished: return

		gem_text.text = "%d" % i

		gem_audio.play()
		gem_audio.pitch_scale = float(gem_audio_max_pitch * i - i)/collected_gems + 1

		var wait_time = (gem_delay_max - gem_delay_min) * gem_delay_curve.sample(float(i)/collected_gems) + gem_delay_min
		await get_tree().create_timer(wait_time).timeout
	
	on_gem_count_finished()

func on_gem_count_finished():
	counted_gems.emit(collected_gems)

	gem_count_finished = true
	gem_text.text = "%d/%d" % [collected_gems, gem_total]
	woo_audio.play()

	await get_tree().create_timer(wait_after_gems).timeout

	# counting open chests
	for i in range(len(chests)):
		if !chests[i].open: continue
		ui_chests[i].play("open")
		await get_tree().create_timer(chest_delay).timeout


