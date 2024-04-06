class_name JumpHeldCondition extends ConditionalInput

func get_value():
	return Input.is_action_pressed("jump")

