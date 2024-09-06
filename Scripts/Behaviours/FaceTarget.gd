class_name FaceTarget extends Behaviour

@export var sprite: Sprite2D

@export var target_obj: Node2D
@export var target_res: NodeResource

@export var offset: float

@export var facing_right: bool = true

@onready var target = target_obj if target_obj else get_node(target_res.value)

func _process(_delta):
	if target.global_position.x < sprite.global_position.x + offset: sprite.flip_h = facing_right
	else: sprite.flip_h = !facing_right

