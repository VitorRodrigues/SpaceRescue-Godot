extends Node

const ENEMY_GROUP = "enemy"

func get_camera():
	return get_tree().root.get_node("main").get_node("Camera")
