class_name PlaySound extends AudioStreamPlayer

@export var pitch_range: float

func play_rand_pitch():
	pitch_scale = 1 + (randf() - 0.5) * pitch_range
	play()
