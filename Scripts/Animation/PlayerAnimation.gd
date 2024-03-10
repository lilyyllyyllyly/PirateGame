class_name PlayerAnimation extends AnimationPlayer

@export  var sprite_path: NodePath
@onready var sprite = get_node(sprite_path) as Sprite2D

@export  var body_path: NodePath
@onready var body = get_node(body_path) as CharacterBody2D

@export  var input_path: NodePath
@onready var input = get_node(input_path) as GenericInput

var in_water

func play_reset(anim):
	if current_animation != anim:
		play("RESET")
		queue(anim)

func _process(delta):
	sprite.flip_h = input.direction.x < 0 || (input.direction.x == 0 && sprite.flip_h)

	if in_water:
		play_reset("player-float")
		return

	if not body.is_on_floor():
		play_reset("player-jump")
		return

	if body.velocity.length() > 0:
		play_reset("player-walk")
	else:
		play_reset("player-idle")

