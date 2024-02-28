class_name GroundInput extends GenericInput

func get_direction():
	return Vector2(Input.get_axis("left", "right"), 0)

func get_jump_held():
	return Input.is_action_pressed("jump")

func get_jump_pressed():
	return Input.is_action_just_pressed("jump")

