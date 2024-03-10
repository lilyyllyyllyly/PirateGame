class_name WaterMovement extends MovementCalculator

@export  var body_path: NodePath
@onready var body = get_node(body_path) as CharacterBody2D

@export_group("Water Movement")
@export var water_speed_base:	float
@export var water_speed_max:	float
@export var water_accel:	float

@export_group("Boost")
@export var boost_gain:	float
@export var boost_loss:	float
@export var boost_move: float
@export var boost_time:	int
@export var boost_effect: PackedScene
@export var water_leave_boost:	float

@onready var water_speed = water_speed_base
var last_boost = 0

func calculate_movement(delta):
	var move = body.velocity
	var now = Time.get_ticks_msec()

	var goal_vel = input.direction * water_speed

	if water_speed > water_speed_base:
		water_speed = clamp(water_speed - boost_loss*delta, water_speed_base, water_speed_max)

	if (now - last_boost > boost_time) and input.jump_pressed:
		# boosting
		water_speed = clamp(water_speed + boost_gain, water_speed_base, water_speed_max)
		move += input.direction * boost_move
		last_boost = now
		
		# spawning boost effect
		var new_effect = boost_effect.instantiate()
		new_effect.rotation = atan2(-input.direction.y, -input.direction.x) + 3*PI/2
		new_effect.position = body.position
		get_tree().current_scene.add_child(new_effect)

	var max_move = water_accel * delta
	move += (goal_vel - move).limit_length(max_move)

	return move

func on_water_leave(_area):
	var boost_mult = (water_speed - water_speed_base) / (water_speed_max - water_speed_base)
	if boost_mult <= 0: return
	print(boost_mult)

	body.velocity += input.direction * water_leave_boost * boost_mult
		
	# spawning boost effect
	var new_effect = boost_effect.instantiate()
	new_effect.rotation = atan2(-input.direction.y, -input.direction.x) + 3*PI/2
	new_effect.position = body.position
	get_tree().current_scene.add_child(new_effect)

