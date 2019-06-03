extends Node

const ENEMY_GROUP = "enemy"

var score = 0 setget setScore

signal score_changed

func _ready():
	randomize()

func get_camera():
	return get_tree().root.get_node("main").get_node("Camera")

func addScore(value):
	self.score += value

func setScore(value):
	if value > 0:
		score = value
		emit_signal("score_changed")
