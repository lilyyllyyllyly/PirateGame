class_name FaceMovement extends Behaviour

@export var sprite: Sprite2D
@export var facing_right: bool = true

@onready var old_pos = sprite.global_position.x

func _process(_delta):
	if sprite.global_position.x == old_pos: return

	if sprite.global_position.x < old_pos: sprite.flip_h = facing_right
	else: sprite.flip_h = !facing_right

	old_pos = sprite.global_position.x

