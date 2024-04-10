class_name GreenFishAnimation extends AnimationPlayer

@export var sprite: Sprite2D
@export var direction: DirectionalInput

func _ready():
	play("fish")

func _process(delta):
	sprite.flip_h = direction.value.x > 0 || (direction.value.x == 0 && sprite.flip_h)

