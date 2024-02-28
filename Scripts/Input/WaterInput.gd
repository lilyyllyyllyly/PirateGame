class_name WaterInput extends GenericInput

func get_direction():
	return Input.get_vector("left", "right", "up", "down")

func get_jump_held():
	return Input.is_action_pressed("jump")

func get_jump_pressed():
	return Input.is_action_just_pressed("jump")

