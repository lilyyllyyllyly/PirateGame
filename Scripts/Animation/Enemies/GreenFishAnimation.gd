class_name GreenFishAnimation extends AnimationPlayer

@export var sprite: Sprite2D
@export var input: GenericInput

func _ready():
	play("fish")

func _process(delta):
	sprite.flip_h = input.direction.x > 0 || (input.direction.x == 0 && sprite.flip_h)

