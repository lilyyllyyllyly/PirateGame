class_name PirateGun extends Spawner

@export var proj_speed: float

@export  var sprite: Sprite2D
@onready var default_offset = sprite.offset.x

@export  var muzzle_flash: Sprite2D
@onready var def_flash_pos = muzzle_flash.position.x

@export  var player_res: NodeResource
@onready var player: Node2D = get_node(player_res.value) as Node2D

@export var center_offset: float

@export var anim: AnimationPlayer

var facing_left = true

@onready var def_spawn_offset = offset.x

func _process(delta):
	if !is_instance_valid(player): return

	if anim.current_animation != "shoot":
		facing_left = player.global_position.x < sprite.global_position.x + center_offset

	sprite.flip_h = !facing_left
	sprite.offset.x = default_offset if facing_left else 0

	muzzle_flash.position.x = (def_flash_pos) if facing_left else (-def_flash_pos + center_offset * 2)

func spawn():
	offset.x = (def_spawn_offset) if facing_left else (-def_spawn_offset + center_offset * 2)

	var new = super()
	
	var mover = ConstantMover.new()
	mover.object = new
	mover.move = Vector2(-proj_speed if facing_left else proj_speed, 0)

	new.add_child(mover)
