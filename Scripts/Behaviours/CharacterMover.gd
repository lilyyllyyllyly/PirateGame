class_name CharacterMover extends Behaviour

@export var body: CharacterBody2D

func _physics_process(_delta):
	body.move_and_slide()

