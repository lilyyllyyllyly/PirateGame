class_name PirateGun extends Spawner

@export var proj_speed: float

func spawn():
	var new = super()
	
	var mover = ConstantMover.new()
	mover.object = new
	mover.move = Vector2(-proj_speed, 0)

	new.add_child(mover)
