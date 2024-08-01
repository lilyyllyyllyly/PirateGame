class_name SaveResource extends Resource

@export_file var path: String
var data: Dictionary

var default_data: Dictionary = {
	"tutorial_complete":false,
	"level1_complete":false,
	"level1_total_gems":-1,
	"level1_collected_gems":0,
}

func _init(p_data = default_data, p_path = ""):
	data = p_data
	path = p_path

