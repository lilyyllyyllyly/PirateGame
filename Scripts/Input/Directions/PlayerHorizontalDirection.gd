class_name PlayerHorizontalDirection extends DirectionalInput

func get_value():
	return Vector2(Input.get_axis("left", "right"), 0)

