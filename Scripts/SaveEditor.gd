class_name SaveEditor extends Node

@export var save: SaveResource

func edit_property(key: String, value):
	if !save.data.has(key): return

	save.data[key] = value
	
	var json: String = JSON.stringify(save.data, "\t")
	var save_file: FileAccess = FileAccess.open(save.path, FileAccess.WRITE)

	if !save_file:
		print("ERROR: failed to open save file while editing property!")
		return

	save_file.store_string(json)
	save_file.close()

func print_property(key: String):
	print(save.data[key])

func load():
	if !FileAccess.file_exists(save.path):
		print("WARNING: no save file located!")
		return

	var save_file: FileAccess = FileAccess.open(save.path, FileAccess.READ)
	var json: String = save_file.get_as_text()
	save.data = JSON.parse_string(json)
	save_file.close()

