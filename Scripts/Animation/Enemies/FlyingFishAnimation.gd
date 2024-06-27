class_name FlyingFishAnimation extends AnimationPlayer

@export var max_vel: float
@export var max_angle: float

@export var body: AnimatableBody2D
@onready var body_rid = body.get_rid()

@export var body_sprite: Sprite2D
@export var wing_sprite: Sprite2D

func _process(delta):
	var vel = PhysicsServer2D.body_get_state(body_rid, PhysicsServer2D.BODY_STATE_LINEAR_VELOCITY)
	var dir = -1 if body_sprite.flip_h else 1
	body_sprite.rotation = clamp(deg_to_rad(max_angle) * vel.y / max_vel, -max_angle, max_angle) * dir

func flip_sprites():
	body_sprite.flip_h = !body_sprite.flip_h
	wing_sprite.flip_h = !wing_sprite.flip_h

