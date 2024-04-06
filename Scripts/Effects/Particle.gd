extends GPUParticles2D

func _ready():
	process_material.angle_max = rad_to_deg(-rotation)
	process_material.angle_min = rad_to_deg(-rotation)
	emitting = true

func _process(_delta):
	if (!emitting): queue_free()

