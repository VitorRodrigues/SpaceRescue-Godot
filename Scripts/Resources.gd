extends Node

var paths = []
var enemies_textures = []

const PATHS_DIR = "res://Paths/"
const ENEMY_DIR = "res://Prefabs/Enemies/"

func _ready():
	loadEnemyPaths()
	loadEnemiesTextures()
	pass

func get_random_path():
	return paths[randi() % paths.size()]

func get_random_enemy_texture():
	return enemies_textures[randi() % enemies_textures.size()]

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

func loadEnemiesTextures():
	var dir = Directory.new()
	dir.change_dir(ENEMY_DIR)
	
	dir.list_dir_begin(true, true)
	var file = dir.get_next()
	while file != "":
		var item = load(ENEMY_DIR + file)
		if item is Texture:
			enemies_textures.append(item)
		file = dir.get_next()
	pass
