class_name SwitchMover extends Behaviour

enum AXIS {BOTH, X_AXIS, Y_AXIS}

@export var move_axis : AXIS

@export var obj: Node2D
@export var move: Vector2
@export var speed: float = 64

@onready var start_pos = obj.position
@onready var end_pos = start_pos + move
@onready var goal = end_pos

var start_time = 0

const THRESHOLD = 1

func reset_starting_pos():
	start_pos = obj.position
	end_pos = start_pos + move
	goal = end_pos

func _on_enable():
	super()
	start_time = Time.get_ticks_msec()

func _process(delta):
	var prev_pos = start_pos if goal == end_pos else end_pos

	if ((move_axis == AXIS.BOTH   and obj.position.distance_to(goal) <= THRESHOLD)   or
		(move_axis == AXIS.X_AXIS and abs(obj.position.x - goal.x) <= THRESHOLD) or
		(move_axis == AXIS.Y_AXIS and abs(obj.position.y - goal.y) <= THRESHOLD)):
		goal = prev_pos
		disable()
		return

	match move_axis:
		AXIS.BOTH:
			obj.position = obj.position.move_toward(goal, speed * delta)
		AXIS.X_AXIS:
			obj.position.x = move_toward(obj.position.x, goal.x, speed * delta)
		AXIS.Y_AXIS:
			obj.position.y = move_toward(obj.position.y, goal.y, speed * delta)

