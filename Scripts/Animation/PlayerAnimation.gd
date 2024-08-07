class_name PlayerAnimation extends AnimationPlayer

@export var sprite: Sprite2D
@export var body: CharacterBody2D

@export var player_bandana_res: BoolResource

@export_group("Input")
@export var plane_direction:      DirectionalInput
@export var horizontal_direction: DirectionalInput

@export_group("Rotation")
@export var swim_stop_rot: float
@export var rot_offset_deg: float
@onready var rot_offset = deg_to_rad(rot_offset_deg)

var in_water: bool
var direction: Vector2
var rot_goal: float

func fwrap(x, minv, maxv):
	if minv > maxv: return fwrap(x, maxv, minv)
	return (maxv if x < 0 else minv) + fmod(x, maxv - minv)

func play_reset(anim):
	if player_bandana_res.value: anim = anim + "-bandana" # horribly hardcoded, whoops
	if current_animation == anim or current_animation == "RESET": return

	play("RESET")
	queue(anim)

func on_jump_pressed():
	if !in_water: return

	rot_goal = fwrap(atan2(direction.y, direction.x) + rot_offset, 0, TAU)
	# horribly hardcoded again
	play("player-boost" if !player_bandana_res.value else "player-boost-bandana")
	queue("player-swim" if !player_bandana_res.value else "player-swim-bandana")

func on_enter_water():
	in_water = true

func on_exit_water():
	in_water = false

func _process(delta):
	direction = plane_direction.value if in_water else horizontal_direction.value

	sprite.flip_h = direction.x < 0 || (direction.x == 0 && sprite.flip_h)
	
	rotate_to_goal(delta)

	if in_water:
		water_animations()
		return

	ground_animations()

func rotate_to_goal(delta):
	var wrap_rot = fwrap(sprite.rotation, 0, TAU)
	if wrap_rot == rot_goal: return

	# getting rotate amount left to reach goal
	var rot_left = rot_goal - wrap_rot

	# going in shortest direction
	if abs(rot_left) > PI:
		rot_left = -sign(rot_left)*(TAU+rot_left)

	# rotating
	sprite.rotation += clamp(rot_left, -swim_stop_rot*delta, swim_stop_rot*delta)

func water_animations():
	if current_animation == "player-boost" or current_animation == "player-boost-bandana":
		return

	# - stopped -
	if body.velocity.length() == 0:
		play_reset("player-float")
		rot_goal = 0
		return

	# - moving -

	# setting rotation goal
	var heading = body.velocity.normalized()
	rot_goal = fwrap(atan2(heading.y, heading.x) + rot_offset, 0, TAU)

	# playing animation
	play_reset("player-swim")

func ground_animations():
	rot_goal = 0 # stay upright when not on water

	if not body.is_on_floor():
		play_reset("player-jump")
		return

	if body.velocity.length() > 0:
		play_reset("player-walk")
	else:
		play_reset("player-idle")

