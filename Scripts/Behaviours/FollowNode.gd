@tool
class_name FollowNode extends Behaviour

@export_group("Objects")
@export var follower: Node2D
@export var target: Node2D

@export_group("Parameters")
@export var follow_offset: Vector2
@export var deadzone: Rect2:
	set(value):
		if deadzone == value: return
		deadzone = value
		if drawer: drawer.queue_redraw()

@export_group("Editor Visualization")
@export var drawer: CanvasItem
@export var deadzone_color: Color = Color(1.0, 0.0, 0.0, 0.3):
	set(value):
		if deadzone_color == value: return
		deadzone_color = value
		if drawer: drawer.queue_redraw()
@export var draw_on_runtime: bool = false:
	set(value):
		if draw_on_runtime == value: return
		draw_on_runtime = value
		if drawer: drawer.queue_redraw()

func _draw():
	if !drawer or (!Engine.is_editor_hint() and !draw_on_runtime): return
	drawer.draw_rect(deadzone, deadzone_color)

func _process(_delta):
	if !follower or !target or Engine.is_editor_hint(): return

	var target_pos = target.position + follow_offset

	follower.position.x = clamp(follower.position.x, target_pos.x - deadzone.end.x, target_pos.x - deadzone.position.x)
	follower.position.y = clamp(follower.position.y, target_pos.y - deadzone.end.y, target_pos.y - deadzone.position.y)

func set_target(new_target: NodePath):
	target = get_node(new_target)

func set_offset(new_offset: Vector2):
	follow_offset = new_offset


