extends Node

var paths = []
const PATHS_DIR = "res://Paths/"
func _ready():
	loadEnemyPaths()
	pass

func get_random_path():
	return paths[randi() % paths.size()]

func loadEnemyPaths():
	var dir = Directory.new()
	dir.change_dir(PATHS_DIR)
	
	dir.list_dir_begin(true, true)
	var file = dir.get_next()
	while file != "":
		var item = load(PATHS_DIR + file)
		if item is Curve2D:
			paths.append(item)
		file = dir.get_next()
	pass
