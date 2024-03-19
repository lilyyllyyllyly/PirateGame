class_name PlayerAnimation extends AnimationPlayer

@export  var sprite_path: NodePath
@onready var sprite = get_node(sprite_path) as Sprite2D

@export  var body_path: NodePath
@onready var body = get_node(body_path) as CharacterBody2D

@export  var ground_input_path: NodePath
@onready var ground_input = get_node(ground_input_path) as GenericInput

@export  var water_input_path: NodePath
@onready var water_input = get_node(water_input_path) as GenericInput

@export  var rot_offset_deg: float
@onready var rot_offset = deg_to_rad(rot_offset_deg)

var in_water

var input

@export_group("Rotation")
@export var swim_stop_rot: float
var rot_goal: float

func fwrap(x, min, max):
	if min > max: return fwrap(x, max, min)
	return (max if x < 0 else min) + fmod(x, max - min)

func play_reset(anim):
	if current_animation != anim:
		play("RESET")
		queue(anim)

func _process(delta):
	input = water_input if in_water else ground_input
	sprite.flip_h = input.direction.x < 0 || (input.direction.x == 0 && sprite.flip_h)
	
	var wrap_rot = fwrap(sprite.rotation, 0, TAU)
	if wrap_rot != rot_goal:
		# getting rotate amount left to reach goal
		var rot_left = rot_goal-wrap_rot

		# going in shortest direction
		if abs(rot_left) > PI:
			rot_left = -sign(rot_left)*(TAU+rot_left)
			
		# rotating
		sprite.rotation += clamp(rot_left, -swim_stop_rot*delta, swim_stop_rot*delta)

	if in_water:
		if input.jump_pressed:
			rot_goal = fwrap(atan2(input.direction.y, input.direction.x) + rot_offset, 0, TAU)
			play("player-boost")
			queue("player-swim")
			return

		if current_animation == "player-boost":
			return

		if body.velocity.length() > 0:
		#if input.direction.length() > 0:
			# rotating
			var heading = body.velocity.normalized()
			rot_goal = fwrap(atan2(heading.y, heading.x) + rot_offset, 0, TAU)
			#rot_goal = fwrap(atan2(input.direction.y, input.direction.x) + rot_offset, 0, TAU)

			# playing animation
			play_reset("player-swim")
		else:
			play_reset("player-float")
			rot_goal = 0
		return

	rot_goal = 0

	if not body.is_on_floor():
		play_reset("player-jump")
		return

	if body.velocity.length() > 0:
		play_reset("player-walk")
	else:
		play_reset("player-idle")

