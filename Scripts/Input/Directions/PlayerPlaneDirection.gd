class_name PlayerPlaneDirection extends DirectionalInput

func get_value():
	return Input.get_vector("left", "right", "up", "down")

